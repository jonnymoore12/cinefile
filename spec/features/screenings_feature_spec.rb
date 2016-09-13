require 'rails_helper'
require "pry"

feature 'screenings' do
  context 'allows admin to manage screenings' do

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

  context "A user wants to know about upcoming screenings" do
    scenario "User's are notified of an upcoming screening for a film on their Cinefile" do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      screening = Screening.create(film_id: film.id, screen_date: Time.now + 86400)
      sign_up
      click_link_cinefile
      add_film
      expect(page).to have_content("Brazil has an upcoming screening")
    end
  end
end
