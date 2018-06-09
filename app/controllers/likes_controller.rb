class LikesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    Like.create(user: current_user, article: article)
    redirect_to article
  end
end
