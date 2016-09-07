require 'rails_helper'

feature "Cinefiles" do
  context "A user doesn't have a cinefile" do
    it "is prompted when a user doesn't have a cinefile" do
      sign_up
      click_link "Dashboard"
      expect(page).to have_content("You don't have a Cinefile!")
    end
    it 'Can create a new cinefile' do
      sign_up
      click_link "Dashboard"
      click_button "Create Cinefile"
      click_button "Create Cinefile"
      expect(page).to have_content("example@email.com's Cinefiles:")
    end
  end
end
