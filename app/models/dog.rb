class Dog < ApplicationRecord
  belongs_to :breed
  validates_presence_of :photo
  validates_presence_of :votes
  validates_presence_of :total_score

  def self.cutest_dogs
    Dog.select("dogs.*, total_score/votes AS ave_score").order("total_score/votes desc")
  end
end
