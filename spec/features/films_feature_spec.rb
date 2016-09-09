require 'rails_helper'

feature 'films' do
  scenario 'allows users to add films to their cinefile' do
    sign_up
    add_film
    expect(page).to have_content("Indiana Jones")
  end
end

context 'deleting films' do
  xscenario 'allows you to remove a film from your cinefile' do
    sign_up
    add_film
    click_button 'Delete Indiana Jones'
    expect(page).not_to have_content "Indiana Jones"
    expect(page).to have_content "Film deleted successfully"
  end
end
