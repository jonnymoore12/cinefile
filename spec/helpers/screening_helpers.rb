def add_screening
  visit '/cinemas'
  click_link 'Odeon Cheltenham'
  click_link 'Add screening to Odeon Cheltenham'
  fill_in 'Date', with: "09/09/16"
  fill_in 'Time', with: "10:00"
  select 'Brazil', from: 'film_id'
  click_button 'Add Screening'
end
