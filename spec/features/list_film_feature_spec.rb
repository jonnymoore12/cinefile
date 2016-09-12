require 'rails_helper'

feature "list_films - Adding films to cinefile" do
  context "A user wishes to add a film to their cinefile" do
    Film.create(title: "Jaws")
    xit "A user can add a film" do
      sign_up
      visit '/'
      click_link "Cinefile"
      click_button "Add Film"
      fill_in "Title", with: "Jaws"
      click_button "Submit"
      expect(page).to have_content("Jaws")
    end
  end

  context "check if film already exists locally" do
    xscenario 'film already exists in local database' do
      sign_up
      visit '/'
      click_link_cinefile
      # Needs more here!
    end
  end
end
