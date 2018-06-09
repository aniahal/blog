class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
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
