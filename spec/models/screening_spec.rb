require 'rails_helper'

describe Screening, type: :model do
  it { is_expected.to belong_to :film }
  it { is_expected.to belong_to :cinema }
end
