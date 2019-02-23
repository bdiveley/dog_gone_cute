class Dog < ApplicationRecord
  belongs_to :breed
  validates_presence_of :photo
  validates_presence_of :votes
  validates_presence_of :total_score  
end
