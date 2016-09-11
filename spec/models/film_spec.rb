# describe Film, type: :model do
#   it 'has a title' do
#     film = Film.new(title: "Jaws")
#     expect(film.title).to eq "Jaws"
#   end
# end

require 'rails_helper'

describe Film, type: :model do
  it { is_expected.to have_many :list_films }
end
