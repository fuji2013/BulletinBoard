class Category < ActiveRecord::Base
  has_many :boards
  validates :name, presence: true
end
