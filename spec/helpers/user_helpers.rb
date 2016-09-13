def sign_up
  visit '/'
  click_link "SIGN UP"
  fill_in "Username", with: "test"
  fill_in "Email", with: "example@email.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

def add_film(title: 'Brazil')
  fill_in :search, with: title
  click_button 'Search for film'
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
