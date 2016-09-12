feature "#Homepages" do
  it "There is a homepage welcoming users to Cinefile" do
    sign_up
    visit '/'
    expect(page).to have_content("Welcome to Cinefile!")
  end
end
