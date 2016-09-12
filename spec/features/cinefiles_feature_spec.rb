require 'rails_helper'

feature "Cinefiles" do
  context "User signed in" do
    before do
      sign_up
      click_link_cinefile
    end

    scenario 'A Cinefile link is available to signed in users' do
      expect(page).to have_content "Welcome to test's Cinefile"
    end

    scenario "A user can add a film to their cinefile list" do
      click_link "Add Film"
      fill_in 'Title', with: '12 Angry Men'
      click_button 'Film'
      expect(page).to have_content '12 Angry Men'
    end

    scenario "A user cannot add a film which already exists in their cinefile" do
      click_link "Add Film"
      fill_in 'Title', with: '12 Angry Men'
      click_button 'Film'
      click_link "Add Film"
      fill_in 'Title', with: '12 Angry Men'
      click_button 'Film'
      expect(page).to have_content "12 Angry Men had previously been Cinefiled"
    end
  end
end
