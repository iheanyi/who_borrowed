require 'rails_helper'

describe Item do
  let(:user) { FactoryGirl.create(:user) }
  before { @item = user.items.build(name: "Lorem Ipsum") }

  subject { @item }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:image) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @item.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before{ @item.name = " " }
    it { should_not be_valid }
  end

end
