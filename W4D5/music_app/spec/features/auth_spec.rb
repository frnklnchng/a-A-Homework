require 'rails_helper'

feature "signup process" do

  scenario "has new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "user@www.com"
      fill_in 'Password', :with => "password"
      click_on "create user"
    end

    scenario "redirects sign-in page after signup" do
      expect(page).to have_content "Successfully created your account! Check your inbox for an activation email."
    end
  end

  feature "with invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "user@www.com"
      click_on "create user"
    end

    scenario "re-renders new user page after failed signup" do
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

end
