require 'rails_helper'

describe Film, type: :model do
  it { is_expected.to have_many :list_films }

  it "is not valid unless it has a unique tmdb_id" do
    Film.create(title: "Midnight Oil", tmdb_id: "300")
    film = Film.new(title: "Midnight Gas", tmdb_id: "300")
    expect(film).to have(1).error_on(:tmdb_id)
  end
end
