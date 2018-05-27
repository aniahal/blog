class CommentsController < ApplicationController
  before_action :find_article

  http_basic_authenticate_with name: "admin", password: "secret",
    only: :destroy

  def create
    @comment = Comment.new(comment_params.merge(article_id: @article.id))
    if @comment.save
      session[:commenter] = @comment.commenter
      redirect_to @article
    else
      render 'articles/show'
    end
  end

  def destroy
    comment = @article.comments.find(params[:id])
    comment.destroy
    redirect_to @article
  end

private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end