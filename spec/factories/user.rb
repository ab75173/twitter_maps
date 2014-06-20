FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password "password"
    zip_code "07060"
  end
end
