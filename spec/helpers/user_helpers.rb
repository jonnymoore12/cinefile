def sign_up
  visit '/'
  click_link "SIGN UP"
  fill_in "Username", with: "test"
  fill_in "Email", with: "example@email.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

def sign_in_with_username
  click_link "LOG IN"
  fill_in "Login", with: "test"
  fill_in "Password", with: "password"
  click_button "Log in"
end

def sign_in_with_email
  click_link "LOG IN"
  fill_in "Login", with: "example@email.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

def add_film(title: 'Brazil')
  fill_in :search, with: title
  click_button 'Search'
  click_button "Add film"
end

def click_link_cinefile
  within(".navbar-right") do
    click_link("CINEFILE")
  end
end

def add_film_temp
  visit 'films/new'
  fill_in "Title", with: "Jaws"
  fill_in "Tmdb", with: "200"
  click_button "Add Film"
end

def add_screening
  visit '/cinemas'
  click_link 'Odeon Cheltenham'
  click_link 'Add screening to Odeon Cheltenham'
  fill_in 'Date', with: "09/09/16"
  fill_in 'Time', with: "10:00"
  select 'Brazil', from: 'film_id'
  click_button 'Add Screening'
end
