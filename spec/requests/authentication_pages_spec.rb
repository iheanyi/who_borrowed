require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit login_path }

    it { should have_content("Login Here") }
    describe "With invalid information" do
      before { click_button "Login" }

      it { should have_content("Login Here") }
      it { should have_selector('div.alert.alert-danger') }

    end


    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Login"
      end

      it { should have_content("User Inventory") }
      it { should have_link(user.username, href: "#") }
      it { should have_link('Logout', href: logout_path) }
      it { should_not have_link('Login', href: login_path) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end
  end
end