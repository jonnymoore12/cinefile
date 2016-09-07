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

context 'deleting films' do
  scenario 'allows you to remove a film from your cinefile' do
    sign_up
    click_link 'Cinefile'
    click_button "Add a film"
    fill_in "Title", with: "Indiana Jones"
    click_button "Add to Cinefile"
    click_button 'Delete Indiana Jones'
    expect(page).not_to have_content "Indiana Jones"
    expect(page).to have_content "Film deleted successfully"
  end
end
