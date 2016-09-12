require 'rails_helper'

feature "Cinefiles" do
  context "User signed in" do
    before do
      add_film_temp
      sign_up
      click_link_cinefile
    end

    scenario 'A Cinefile link is available to signed in users' do
      expect(page).to have_content "Welcome to test's Cinefile"
    end

    scenario "A user can add a film to their cinefile list" do
        click_link "Add Film"
        films = Film.all
        filmid = films.last.id
        fill_in "Local film id", with: filmid
        click_button "Add Id"
        expect(page).to have_content("Jaws")
    end
  end
end
