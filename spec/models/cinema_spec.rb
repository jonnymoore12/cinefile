require 'rails_helper'

describe Cinema, type: :model do
  it { is_expected.to have_many :screenings }
  it { is_expected.to have_many :films }
end
