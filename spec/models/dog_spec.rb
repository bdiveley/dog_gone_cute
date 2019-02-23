require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:photo) }
    it { is_expected.to validate_presence_of(:votes) }
    it { is_expected.to validate_presence_of(:total_score) }
  end
  describe "Relationships" do
    it { is_expected.to belong_to(:breed) }
  end
  describe "Class Methods" do
    it "dogs ordered by cutest average rating" do
      dog_1 = create(:dog, votes: 15, total_score: 39)
      dog_2 = create(:dog, votes: 10, total_score: 10)
      dog_3 = create(:dog, votes: 20, total_score: 35)
      dog_4 = create(:dog, votes: 35, total_score: 75)

      dogs = Dog.find_dogs("desc")

      expect(dogs.length).to eq(4)
      expect(dogs[0]).to eq(dog_1)
      expect(dogs[1]).to eq(dog_4)
      expect(dogs[2]).to eq(dog_3)
      expect(dogs[3]).to eq(dog_2)
    end
    it "dogs ordered by worst average rating" do
      dog_1 = create(:dog, votes: 15, total_score: 39) #2.6
      dog_2 = create(:dog, votes: 10, total_score: 10) #1
      dog_3 = create(:dog, votes: 20, total_score: 35) #1.75
      dog_4 = create(:dog, votes: 35, total_score: 75) #2.14

      dogs = Dog.find_dogs("asc")

      expect(dogs.length).to eq(4)
      expect(dogs[0]).to eq(dog_2)
      expect(dogs[1]).to eq(dog_3)
      expect(dogs[2]).to eq(dog_4)
      expect(dogs[3]).to eq(dog_1)
    end

    it "dogs filtered by breed and ordered by cutest average rating" do
      breed = create(:breed)
      dog_1 = create(:dog, votes: 15, total_score: 39, breed_id: breed.id)
      dog_2 = create(:dog, votes: 10, total_score: 10)
      dog_3 = create(:dog, votes: 20, total_score: 35, breed_id: breed.id)
      dog_4 = create(:dog, votes: 35, total_score: 75)

      dogs = Dog.find_dogs_by_breed("desc", breed.id)

      expect(dogs.length).to eq(2)
      expect(dogs[0]).to eq(dog_1)
      expect(dogs[1]).to eq(dog_3)
    end
    it "dogs filtered by breed and ordered by worst average rating" do
      breed = create(:breed)
      dog_1 = create(:dog, votes: 15, total_score: 39, breed_id: breed.id)
      dog_2 = create(:dog, votes: 10, total_score: 10)
      dog_3 = create(:dog, votes: 20, total_score: 35, breed_id: breed.id)
      dog_4 = create(:dog, votes: 35, total_score: 75)

      dogs = Dog.find_dogs_by_breed("asc", breed.id)

      expect(dogs.length).to eq(2)
      expect(dogs[0]).to eq(dog_3)
      expect(dogs[1]).to eq(dog_1)
    end
  end
end
