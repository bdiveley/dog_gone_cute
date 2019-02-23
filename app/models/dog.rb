class Dog < ApplicationRecord
  belongs_to :breed
  validates_presence_of :photo
  validates_presence_of :votes
  validates_presence_of :total_score

  def self.find_dogs(order)
    Dog.select("dogs.*, total_score / CAST (votes AS FLOAT) AS ave_score").order("ave_score #{order}")
  end

  def self.find_dogs_by_breed(order, breed)
    Dog.select("dogs.*, total_score / CAST (votes AS FLOAT) AS ave_score").where(breed_id: breed).order("ave_score #{order}")
  end
end
