require 'rails_helper'

feature 'NOW SHOWING page' do
  before do
    sign_up
  end

  context "No upcoming screenings" do
    scenario 'Users are prompted to add films to their Cinefile first if they have not done so yet' do
      click_link 'NOW SHOWING'
      expect(page).to have_content 'Please add films first so we can keep you updated of any screenings :)'
    end

    scenario 'Users are told if there are no upcoming screenings for their Cinefile films' do
      click_link_cinefile
      add_film
      click_link 'NOW SHOWING'
      expect(page).to have_content 'There are no upcoming screenings for the films in your Cinefile'
    end
  end

  context "At least one upcoming screening" do
    scenario "A user goes to 'NOW SHOWING' from their homepage and sees info on screening and cinema" do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      cinema = Cinema.create(name: 'Curzon Victoria', phone: 03305001331, address: '58 Victoria Street, London',
                            postcode: 'SW1E 6QW', website: 'http://www.curzoncinemas.com/victoria/now-showing')
      screening = Screening.create(film_id: film.id, screen_time: "22:00", screen_date: Time.now + 86400, cinema_id: cinema.id)
      click_link_cinefile
      add_film
      click_link 'NOW SHOWING'
      expect(page).to have_content('22:00')
      expect(page).to have_content('Brazil')
      expect(page).to have_content('Curzon Victoria')
    end
  end
end
