require 'rails_helper'

describe ListFilm, type: :model do
  it { is_expected.to belong_to :cinefile }
  it { is_expected.to belong_to :film }

end
