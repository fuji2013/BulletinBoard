require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#name' do
    context '空白のとき' do
      it 'validでないこと' do
        category = Category.new(name: '')
        category.valid?
        expect(category.errors[:name]).to be_present
      end
    end
  end
end
