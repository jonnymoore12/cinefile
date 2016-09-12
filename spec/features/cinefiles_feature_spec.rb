require 'rails_helper'

feature "managing cinefiles" do
  context "User signed in" do
    before do
      sign_up
      click_link_cinefile
    end

    scenario 'A Cinefile link is available to signed in users' do
      expect(page).to have_content "Welcome to test's Cinefile"
    end

    scenario "A user can add a film to their cinefile list" do
      add_film
      expect(page).to have_content 'Brazil'
    end

    scenario "A user cannot add a film which already exists in their cinefile" do
      add_film
      add_film
      expect(page).to have_content "Brazil had previously been Cinefiled"
    end

    scenario "Film and release year are displayed for each film in Cinefile" do
      add_film
      expect(page).to have_content 'Brazil'
      expect(page).to have_content '1985'
    end

    scenario "Films with commas can be added to cinefiles without causing errors" do
      add_film(title: 'The Good, the Bad and the Ugly')
      expect(page).to have_content "The Good, the Bad and the Ugly"
    end

    scenario "Film images are included on user's cinefiles" do
      add_film(title: 'Fight Club')
      expect(page).to have_css("//img[@src*='http://cf2.imgobject.com/t/p/w500//8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg']")
    end
  end
end
