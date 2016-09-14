require 'rails_helper'

feature "managing films" do
  context 'deleting films' do
    let!(:movie){ Film.create(title: 'Dead As A Dodo', tmdb_id: '100') }

    scenario 'Film can be deleted' do
      visit '/films'
      click_link 'Delete Dead As A Dodo'
      expect(page).not_to have_content 'Dead As A Dodo'
    end
  end
end
