class Board < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: :all_blank
  validates :title, presence: true
  validates :owner, presence: true
end
