class Board < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates :title, presence: true
  validates :owner, presence: true

  def last_updated_at
    comments.order(:updated_at).last.updated_at
  end
end
