require 'rails_helper'

describe Film, type: :model do
  it { is_expected.to have_many :list_films }
  it { is_expected.to have_many :screenings }


  it "is not valid unless it has a unique tmdb_id" do
    Film.create(title: "Midnight Oil", tmdb_id: "300")
    film = Film.new(title: "Midnight Gas", tmdb_id: "300")
    expect(film).to have(1).error_on(:tmdb_id)
  end
end

describe '#upcoming_screening?' do

  context 'Upcoming screenings' do
    it 'returns TRUE when there is an upcoming screening within one fortnight' do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      screening = Screening.create(film_id: film.id, screen_date: Time.now + 86400)
      expect(film.upcoming_screening?).to eq true
    end
  end

  context 'No upcoming screenings' do
    it 'returns FALSE when there are no upcoming screenings at all' do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      expect(film.upcoming_screening?).to eq false
    end

    it 'returns FALSE when the only upcoming screenings are not within a fortnight' do
      film = Film.create(title: 'Brazil', tmdb_id: '68', poster_path: '/pVlZBKp8v3Jzd0ahPmrBGlbeQ2s.jpg')
      screening = Screening.create(film_id: film.id, screen_date: Time.now + 1300000)
      expect(film.upcoming_screening?).to eq false
    end
  end
end
