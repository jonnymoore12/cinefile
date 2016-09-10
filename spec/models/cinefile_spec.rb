require 'rails_helper'

describe Cinefile, type: :model do
  it { is_expected.to have_many :list_films }
  it { is_expected.to belong_to :user }
end
