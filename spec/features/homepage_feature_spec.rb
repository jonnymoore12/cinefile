feature "#Homepages" do
  it "The first page is the homepage" do
    visit '/'
    expect(page).to have_content("Welcome to Cinefile!")
  end
end
