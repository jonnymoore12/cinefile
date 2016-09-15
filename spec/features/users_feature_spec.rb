require 'rails_helper'

feature "Users" do

  context "No user currently signed in" do
    it "A user can sign up" do
      sign_up
      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to_not have_content("SIGN UP")
    end
    it "A user can log in" do
      sign_up
      click_link "LOG OUT"
      click_link "LOG IN"
      fill_in "Login", with: "test"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to_not have_content("SIGN UP")
      expect(page).to_not have_content("LOG IN")
    end
  end

  context "User currently signed in" do
    scenario "Can see 'Log out' link" do
      sign_up
      expect(page).to have_content "LOG OUT"
      expect(page).not_to have_content "SIGN UP"
    end
    scenario "Can log out" do
      sign_up
      click_link "LOG OUT"
      expect(page).to have_content("SIGN UP")
      expect(page).to have_content("LOG IN")
    end
  end
end
