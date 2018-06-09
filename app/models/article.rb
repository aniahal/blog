class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :likers, through: :likes, source: :user
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 5 }

  def tags=(value)
    super(sanitize_tags(value))
  end

  private

  def sanitize_tags(tags = '')
    tags.downcase.split(',').map(&:strip).uniq
  end
end
