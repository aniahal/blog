class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  def sanitize_tags(tags = '')
    tags.downcase.split(',').map(&:strip).uniq
  end
end
