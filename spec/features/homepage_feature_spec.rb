feature "#Homepages" do
  it "There is a homepage for Cinefile where a user can sign up" do
    visit '/'
    expect(page).to have_content('SIGN UP')
  end
  it "There is a logo homepage button available in the navbar" do
    visit '/'
    expect(page).to have_css("//img[@src*='/assets/Blue_Logo2-4fb5d19a96e88e5354e50f3cf24e0ec98931d7a93ea7d76e0d9aa2494ac85ac5.png']")
  end
end
