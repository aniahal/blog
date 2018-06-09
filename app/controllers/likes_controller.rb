class LikesController < ApplicationController
before_action :find_article

  def create
    Like.create(user: current_user, article: @article)
    redirect_to @article
  end

  def destroy
    like = Like.find_by!(user: current_user, article: @article)
    like.destroy
    redirect_to @article
  end 

  private

  def find_article
    @article = Article.find(params[:article_id])
  end
end
