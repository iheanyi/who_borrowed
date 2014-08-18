require 'spec_helper'

describe "Item pages" do

  subject{ page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "inventory page" do

    before { visit items_path }

    it { should have_content("Your Inventory") }

  end

  describe "item creation" do
    before { visit new_item_path }

    describe "with invalid information" do
      it "should not create an item" do
        expect { click_button "Add Item" }.not_to change(Item, :count)
      end
    end

    describe "with valid information" do
      before { fill_in "item_name", with: "Lorem Ipsum" }

      it "should create an item" do
        expect { click_button "Add Item" }.to change(Item, :count).by(1)
      end
    end
  end

end