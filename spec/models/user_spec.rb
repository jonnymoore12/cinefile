require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_one :cinefile }
<<<<<<< HEAD

  it 'is not valid without a username' do
    user = User.new(username: '')
    expect(user).to have(1).error_on(:username)
  end

  it 'is not valid if the username includes non alphanumeric characters' do
    user = User.new(username: 'Alfred Hitchcock')
    expect(user).to have(1).error_on(:username)
  end
=======
>>>>>>> dbd03424257106d5f536bd88efa59846a50d7a30
end
