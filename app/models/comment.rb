class Comment < ActiveRecord::Base
  belongs_to :board
  validates :text, presence: true
  validates :commentator, presence: true
end
