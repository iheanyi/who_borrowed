
require 'spec_helper'
#require 'rails_helper'

describe User do
  before do
    @user = User.new(name: "Example User", username: "exampleuser", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:items) }
  it { should respond_to(:loans) }
  it { should respond_to(:borrowers) }

  describe "remember token" do
    before { @user.save! }
    its(:remember_token) { should_not be_blank }
  end

  describe "item associations" do
    before { @user.save }

    let!(:a_item) do
      FactoryGirl.create(:item, user: @user, name: "An Item")
    end
    let!(:b_item) do
      FactoryGirl.create(:item, user: @user, name: "B Item")
    end

    it "should have the microposts in the right order" do
      expect(@user.items.to_a).to eq [a_item, b_item]
    end

    #items = @user.items.to_a
    #@user.destroy
    #expect(items).not_to be_empty
    #items.each do |item|

    #end
  end
end
