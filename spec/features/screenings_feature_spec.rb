require 'rails_helper'
require "pry"

feature 'screenings' do
  context "Creating screenings for cinemas" do
    let!(:odeon){ Cinema.create(name: 'Odeon Cheltenham') }
    let!(:movie){ Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg') }

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
      Screening.create(film_id: film.id, screen_date: Time.now + 86400)
      sign_up
      click_link_cinefile
      add_film
      expect(page).to have_content("Brazil has an upcoming screening")
    end

  context "Viewing info on specific screenings" do
    scenario "A user can click through for info on a screening" do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      cinema = Cinema.create(name: 'The Waterfront')
      Screening.create(film_id: film.id, screen_date: Time.now + 86400, cinema_id: cinema.id)
      sign_up
      click_link_cinefile
      add_film
      click_button "Screening Info"
      expect(page).to have_content("Showing at The Waterfront")
    end

    scenario "A user can access a link to the cinema's website" do
      film = Film.create(title: 'Hell or High Water', tmdb_id: '338766', poster_path: '/5GbRKOQSY08U3SQXXcQAKEnL2rE.jpg')
      cinema = Cinema.create(name: 'Curzon Victoria', website: 'http://www.curzoncinemas.com/victoria/now-showing')
      Screening.create(film_id: film.id, screen_date: Time.now + 86400, cinema_id: cinema.id)
      sign_up
      click_link_cinefile
      add_film(title: 'Hell or High Water')
      click_button "Screening Info"
      expect(page).to have_content("Showing at Curzon Victoria")
      expect(page).to have_content("Website: Curzon Victoria Showtimes")
    end
  end

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
end
