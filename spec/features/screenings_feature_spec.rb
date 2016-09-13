require 'rails_helper'

feature 'screenings' do
  before { Cinema.create name: 'Odeon Cheltenham' }

  scenario 'allows admin to create a screening for a cinema' do
     visit '/cinemas'
     click_link 'Add screening to Odeon Cheltenham'
     fill_in "Date", with: "27/9/16"
     fill_in "Time", with: "10:00"
     fill_in "Film", with: "Brazil"
     click_button 'Add Screening'
     expect(current_path).to eq '/cinemas'
     expect(page).to have_content('16/9/16')
  end
end
