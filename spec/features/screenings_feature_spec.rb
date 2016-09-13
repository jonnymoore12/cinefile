require 'rails_helper'
require "pry"

feature 'screenings' do
  context 'allows admin to manage screenings' do

    let!(:odeon){ Cinema.create(name: 'Odeon Cheltenham') }
    let!(:movie){ Film.create(title: 'Brazil', tmdb_id: '68') }
    before do
      add_screening
    end

    scenario 'allows admin to create a screening for a cinema' do
       expect(current_path).to eq "/cinemas/#{odeon.id}"
       expect(page).to have_content("#{movie.id}")
       #expect(page).to have_content("16-09-09")
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
