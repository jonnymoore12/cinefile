require 'rails_helper'

feature 'screenings' do
    let!(:odeon){ Cinema.create(name: 'Odeon Cheltenham') }
    let!(:movie){ Film.create(title: 'Brazil', tmdb_id: '68') }

  scenario 'allows admin to create a screening for a cinema' do
     visit '/cinemas'
     click_link 'Odeon Cheltenham'
     click_link 'Add screening to Odeon Cheltenham'
     fill_in 'Date', with: "09/09/16"
     fill_in 'Time', with: "10:00"
     select 'Brazil', from: 'film_id'
     click_button 'Add Screening'
     expect(current_path).to eq "/cinemas/#{odeon.id}"
     expect(page).to have_content("#{movie.id}")
  end
end
