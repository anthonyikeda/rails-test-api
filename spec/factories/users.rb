FactoryGirl.define do
    factory :user do
        name { Faker::StarWars.character }
        email { Faker::Internet.email }
        address { Faker::Address.street_address }
    end
end