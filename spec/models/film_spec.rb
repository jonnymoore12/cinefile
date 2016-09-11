require 'rails_helper'

describe Film, type: :model do
  it { is_expected.to have_many :list_films }
end
