require 'rails_helper'

feature "managing cinemas" do
  context 'adding cinema details' do
    scenario 'a new cinema is added' do
      visit '/cinemas'
      click_link 'Add Cinema'
      fill_in 'Name', with: 'Odeon Cheltenham'
      fill_in 'Address', with: "The Brewery, Oxford Passage, St. Margaret's Road, Cheltenham"
      fill_in 'Postcode', with: 'GL50 4EF'
      fill_in 'Phone', with: '08712002000'
      click_button 'Add Cinema'

      expect(page).to have_content 'Odeon Cheltenham'
    end
  end
end
