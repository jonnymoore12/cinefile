feature "#Homepages" do
  it "There is a homepage welcoming users to Cinefile" do
    visit '/'
    expect(page).to have_content("Welcome to Cinefile!")
  end
end
