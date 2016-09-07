require 'rails_helper'

feature 'Dashboard' do
  scenario 'A dashboard link is available to signed in users' do
    visit '/'
    sign_up
    click_link 'Dashboard'
    expect(page).to have_content "Welcome to example@email.com's dashboard"
  end
end
