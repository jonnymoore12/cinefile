require 'rails_helper'
require "pry"

feature "Screenings" do

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
