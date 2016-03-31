class Board < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true
  validates :owner, presence: true
end
