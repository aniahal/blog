class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true, length: { in: 6..500 }
  validate :must_contain_at

  private
  
  def must_contain_at
    return if commenter.include? '@'
    errors.add :commenter, 'should contain at'
  end 

end
