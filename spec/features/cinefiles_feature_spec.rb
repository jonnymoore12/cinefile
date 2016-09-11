require 'rails_helper'

feature "Cinefiles" do
  context "User signed in" do

    scenario 'A Cinefile link is available to signed in users' do
      sign_up
      click_link_cinefile
      expect(page).to have_content "Welcome to test's Cinefile"
    end
  end

end
