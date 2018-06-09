module ArticlesHelper
  def already_liked?(user, article)
    user_like(user, article).present?
    # user.liked_articles.include? article
    # article.likers.include? user
  end 

  def user_like(user, article)
    Like.find_by(user: user, article: article)
  end
end
