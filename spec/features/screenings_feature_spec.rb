require 'rails_helper'
require "pry"

feature 'screenings' do
  context "Creating screenings for cinemas" do
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
      Screening.create(film_id: film.id, screen_date: Time.now + 86400, screen_time: "22:00")
      sign_up
      click_link_cinefile
      add_film
      expect(page).to have_link("Screenings")
    end

  context "Viewing info on a film's screenings" do
    scenario "Cinema info is available for each film's screening as well as film info " do
      film = Film.create(title: 'Hell or High Water', tmdb_id: '338766', poster_path: '/5GbRKOQSY08U3SQXXcQAKEnL2rE.jpg')
      cinema = Cinema.create(name: 'Curzon Victoria', phone: 03305001331, address: '58 Victoria Street, London',
                            postcode: 'SW1E 6QW', website: 'http://www.curzoncinemas.com/victoria/now-showing')
      Screening.create(film_id: film.id, screen_date: Time.now + 86400, screen_time: "22:00", cinema_id: cinema.id)
      sign_up
      click_link_cinefile
      add_film(title: 'Hell or High Water')
      click_link "Screenings"
      expect(page).to have_content(03305001331)
      expect(page).to have_content "58 Victoria Street"
      expect(page).to have_content "SW1E 6QW"
      expect(page).to have_content "HELL OR HIGH WATER"
    end

    scenario "A user can access a link to the cinema's website" do
      film = Film.create(title: 'Hell or High Water', tmdb_id: '338766', poster_path: '/5GbRKOQSY08U3SQXXcQAKEnL2rE.jpg')
      cinema = Cinema.create(name: 'Curzon Victoria', phone: 03305001331, address: '58 Victoria Street, London, SW1E 6QW',
                            website: 'http://www.curzoncinemas.com/victoria/now-showing')
      Screening.create(film_id: film.id, screen_date: Time.now + 86400, screen_time: "22:00", cinema_id: cinema.id)
      sign_up
      click_link_cinefile
      add_film(title: 'Hell or High Water')
      click_link "Screenings"
      expect(page).to have_content("Curzon Victoria")
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

  context "Users can clearly see how long there is until upcoming screenings on Cinefile show page" do
    scenario "We see the relevant message when the nearest screening is 3 days away" do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      Screening.create(film_id: film.id, screen_date: Time.now + 259200)
      sign_up
      click_link_cinefile
      add_film
      # Image for 'SCREENING IN 3 DAYS!':
      expect(page).to have_css("//img[@src*='/assets/3_days-15c16ace40133135bb018054c09da3d2516b7cc0e81aa81b7f76c47b78cfa27a.png']")
    end

    scenario "We see the relevant message when the nearest screening is tomorrow" do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      Screening.create(film_id: film.id, screen_date: Time.now + 86400)
      sign_up
      click_link_cinefile
      add_film
      # Image for 'SCREENING TOMORROW!':
      expect(page).to have_css("//img[@src*='/assets/tomorrow-05cdaafd652e33683f752fdab9af5f3aa41cafbd11092f2cbcab5a69a47e8d56.png']")
    end

    scenario "We see the relevant message when the nearest screening is today" do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      Screening.create(film_id: film.id, screen_date: Time.now + 500)
      sign_up
      click_link_cinefile
      add_film
      # Image for 'SCREENING TODAY!':
      expect(page).to have_css("//img[@src*='/assets/today-4192e5af125438055612e4332aac0cbd2440b4a14a2d5746f1af32b6a5360562.png']")
    end
  end
end
end
