class Dog < ApplicationRecord
  belongs_to :breed
  validates_presence_of :photo
  validates_presence_of :votes
  validates_presence_of :total_score

  def average_score
    (total_score / votes.to_f).round(2)
  end
end
