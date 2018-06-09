class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :article_id, uniqueness: { scope: :user_id }
end
