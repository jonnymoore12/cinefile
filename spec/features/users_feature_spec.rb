require 'rails_helper'

feature "Users" do

  context "No user currently signed in" do
    it "A user can sign up" do
      sign_up
      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to_not have_content("SIGN UP")
    end
    it "A user can log in with username" do
      sign_up
      click_link "LOG OUT"
      sign_in_with_username
      expect(page).to_not have_content("SIGN UP")
      expect(page).to_not have_content("LOG IN")
    end
    it "A user can login with email" do
      sign_up
      click_link "LOG OUT"
      sign_in_with_email
      expect(page).to_not have_content("SIGN UP")
      expect(page).to_not have_content("LOG IN")
    end
    it "A user can't sign up with the same username" do
      sign_up
      click_link "LOG OUT"
      sign_up
      expect(page).to have_content("Username has already been taken")
    end
    it "A user can't sign up with the same email" do
      sign_up
      click_link "LOG OUT"
      sign_up
      expect(page).to have_content("Email has already been taken")
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
