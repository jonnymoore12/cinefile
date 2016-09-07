require 'rails_helper'

feature "Users" do

  context "No user currently signed in" do
    it "A user can sign up" do
      sign_up
      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to_not have_content("Sign up")
    end
    it "A user can log in" do
      sign_up
      click_link "Log out"
      click_link "Log in"
      fill_in "Login", with: "test"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to_not have_content("Sign up")
      expect(page).to_not have_content("Log in")
    end
  end

  context "User currently signed in" do
    scenario "Can see 'Log out' link" do
      sign_up
      expect(page).to have_content "Log out"
      expect(page).not_to have_content "Sign up"
    end
    scenario "Can log out" do
      sign_up
      click_link "Log out"
      expect(page).to have_content("Sign up")
      expect(page).to have_content("Log in")
    end
  end
end
