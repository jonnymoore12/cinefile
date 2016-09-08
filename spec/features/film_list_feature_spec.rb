require 'rails_helper'

feature "Adding films to cinefile" do
  context "A user wishes to add a film to her cinefile" do
    let(:film){ Film.create(title: "Jaws") }
    it "A user can add a film" do
      sign_up
      visit '/'
      click_link "Cinefile"
      select('Jaws', :from => 'select')
      expect(page).to have_content("Jaws has been selected")
    end
  end
end
