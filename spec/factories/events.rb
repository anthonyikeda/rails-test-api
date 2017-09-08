FactoryGirl.define do
    factory :event do
        venue { Faker::Lorem.word }
        event_time { Faker::Number.number(10) }
        name { Faker::StarWars.character }
    end
end