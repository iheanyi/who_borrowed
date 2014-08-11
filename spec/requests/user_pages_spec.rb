require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "signin page" do
    before { visit login_path }

    it { should have_content('Login Here') }
  end

  describe "signup page" do
    before { visit register_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      before do
        fill_in "Username", with: "Test User"
        fill_in "Email",    with: "anon@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Password Confirmation", with: "foobar"
      end

      it "should not create a user" do
        expect { click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Username", with: "testuser"
        fill_in "Email",    with: "anon@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Password Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
    it { should have_content("Sign Up") }
  end

  describe "settings page" do
    let(:user) { FactoryGirl.create(:user) }
  end
end