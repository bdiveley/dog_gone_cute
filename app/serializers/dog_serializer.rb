class DogSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :breed, :photo, :ave_score

  attribute :ave_score do |object|
    object.total_score / object.votes.to_f
end
end
