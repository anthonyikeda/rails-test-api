FactoryGirl.define do
    factory :user do
        name { Faker::StarWars.character }
        email { Faker::Internet.email }
        dob { Faker::Date.birthday(18, 65) }
    end
end