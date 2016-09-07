def sign_up
  visit '/'
  click_link "Sign up"
  fill_in "Username", with: "test"
  fill_in "Email", with: "example@email.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end
