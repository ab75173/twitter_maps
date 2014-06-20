require 'rails_helper'

describe User do
  it { should have_many(:favorites) }
  it { should have_many(:events).through(:favorites)}
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:encrypted_password)}

end
