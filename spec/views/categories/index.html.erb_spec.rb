require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before do
    def paginate(items)
    end
    allow(view).to receive(:paginate) {
      Kaminari.paginate_array(Category.all)
    }
    
    Category.delete_all
    assign(:categories,
      FactoryGirl.create_list(:category, 20)
    )
  end
  after(:each) do
    Category.delete_all
  end

  it "renders a list of categories" do
    render
  end
end
