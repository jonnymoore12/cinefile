require 'rails_helper'

feature "managing films" do
  context 'Adding and deleting films' do
    before do
      visit '/films/new'
      fill_in 'Title', with: 'Batman'
      fill_in 'Tmdb', with: '100'
      click_button 'Add Film'
    end

    scenario 'Film can be added' do
      expect(page).to have_content 'Batman'
    end

    scenario 'Film can be deleted' do
      visit '/films'
      click_link 'Delete 100'
      expect(page).not_to have_content 'Batman'
    end
  end
end
