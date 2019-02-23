class DogSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :breed_id, :photo, :ave_score
end
