def sign_up
  visit '/'
  click_link "Sign up"
  fill_in "Username", with: "test"
  fill_in "Email", with: "example@email.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

def add_film
  click_link 'Cinefile'
  click_button "Add a film"
  fill_in "Title", with: "Indiana Jones"
  click_button "Add to Cinefile"
end

def click_link_cinefile
  within(".navbar-right") do
    click_link("Cinefile")
  end
end

def add_film_temp
  visit 'films/new'
  fill_in "Title", with: "Jaws"
  fill_in "Tmdb", with: "200"
  click_button "Add Film"
end
