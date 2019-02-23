FactoryBot.define do
  factory :dog do
    breed
    photo { "https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg"}
    votes { rand(1..20)}
    total_score { rand(1..100)}
  end
end
