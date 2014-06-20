require 'rails_helper'

describe Event do
  it { should have_many(:favorites) }
  it { should have_many(:users).through(:favorites) }

end
