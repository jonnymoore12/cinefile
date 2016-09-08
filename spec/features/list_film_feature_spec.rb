require 'rails_helper'

feature "Adding films to cinefile" do
  context "A user wishes to add a film to her cinefile" do
    Film.create(title: "Jaws")
    it "A user can add a film" do
      sign_up
      visit '/'
      click_link "Cinefile"
      click_button "Add Film"
      fill_in "Title", with: "Jaws"
      click_button "Submit"
      expect(page).to have_content("Jaws")
    end
  end
end
