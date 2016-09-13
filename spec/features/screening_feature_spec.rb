require 'rails_helper'
require "pry"

feature "Screenings" do
  let!(:film) { Film.create title: 'Brazil' }
  before { Screening.create film_id: film.id, screen_date: Time.now + 86400 }

  context "A user wants to know about upcoming screenings" do
    scenario "User's are notified of an upcoming screening for a film on their Cinefile" do
      sign_up
      click_link_cinefile
      add_film
      expect(page).to have_content("Brazil has an upcoming screening")
    end
  end
end
