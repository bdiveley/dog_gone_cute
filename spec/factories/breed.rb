FactoryBot.define do
  factory :breed do
    name { Faker::Dog.breed }
  end
end 
