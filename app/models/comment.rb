class Comment < ActiveRecord::Base
  belongs_to :board, touch: true
  validates :text, presence: true
  validates :commentator, presence: true
end
