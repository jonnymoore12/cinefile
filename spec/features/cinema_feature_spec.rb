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

  context 'viewing cinemas' do
  let!(:odeon){ Cinema.create(name:'Odeon Lee Valley') }

    scenario 'lets a user view a cinema' do
     visit '/cinemas'
     click_link 'Odeon Lee Valley'
     expect(page).to have_content 'Odeon Lee Valley'
     expect(current_path).to eq "/cinemas/#{odeon.id}"
    end
  end

  context 'editing cinemas' do
  before { Cinema.create name: 'Odeon Lee Valley', address: "The Brewery, Oxford Passage, Cheltenham" }

    scenario 'let a user edit a cinema' do
     visit '/cinemas'
     click_link 'Odeon Lee Valley'
     click_link 'Edit'
     fill_in 'Name', with: 'Odeon Lee Valley'
     fill_in 'Address', with: "The Brewery, Oxford Passage, St. Margaret's Road, Cheltenham"
     click_button 'Update Cinema'
     expect(page).to have_content 'Odeon Lee Valley'
     expect(page).to have_content "St. Margaret's Road"
     expect(current_path).to eq '/cinemas'
    end
  end

  context 'deleting cinemas' do
  before { Cinema.create name: 'Odeon Lee Valley', address: "The Brewery, Oxford Passage, Cheltenham" }

    scenario 'removes a cinema when a user clicks a delete link' do
      visit '/cinemas'
       click_link 'Odeon Lee Valley'
      click_link 'Delete'
      expect(page).not_to have_content 'Odeon Lee Valley'
      expect(page).to have_content 'Cinema deleted successfully'
    end
  end
end
