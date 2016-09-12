feature "#Homepages" do
  it "There is a homepage for Cinefile where a user can sign up" do
    visit '/'
    expect(page).to have_content('Cinefile')
    expect(page).to have_content('SIGN UP')
  end
end
