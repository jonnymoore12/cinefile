require 'rails_helper'

feature 'films' do
  scenario 'allows users to add films to their cinefile' do
    sign_up
    click_link 'Cinefile'
    click_button "Add a film"
    fill_in "Title", with: "Indiana Jones"
    click_button "Add to Cinefile"
    expect(page).to have_content("Indiana Jones")
  end
end
