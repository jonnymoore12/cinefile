require 'rails_helper'

feature "managing cinefiles" do
  context "User signed in" do
    before do
      sign_up
      click_link_cinefile
    end

    scenario 'A Cinefile link is available to signed in users' do
      expect(page).to have_content "Welcome to test's Cinefile"
    end

    scenario "A user can add a film to their cinefile list" do
      fill_in :search, with: 'Brazil'
      click_button 'Search for film'
      click_button "Create Film"
      expect(page).to have_content 'Brazil'
    end

    scenario "A user cannot add a film which already exists in their cinefile" do
      fill_in :search, with: 'Brazil'
      click_button 'Search for film'
      click_button "Create Film"
      fill_in :search, with: 'Brazil'
      click_button 'Search for film'
      click_button "Create Film"
      expect(page).to have_content "Brazil had previously been Cinefiled"
    end
  end
end
