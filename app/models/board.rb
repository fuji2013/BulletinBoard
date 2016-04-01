class Board < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates :title, presence: true
  validates :owner, presence: true
end
