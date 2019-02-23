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
  describe "Instance Methods" do
    it "can calculate its average cuteness score" do
      breed = Breed.create(name: "Chow")
      dog = Dog.create(breed_id: breed, photo: "https://cute.dog.png", total_score: 240, votes: 63)

      expect(dog.average_score).to eq(3.81)
    end
  end
end
