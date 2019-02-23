class DogSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :breed_id, :photo, :votes, :total_score
end
