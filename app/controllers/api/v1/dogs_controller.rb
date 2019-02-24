class Api::V1::DogsController < ApplicationController

  def index
    dogs = Dog.find_dogs(params[:order])
    render json: DogSerializer.new(dogs)
  end

  def create
    breed_name = params[:photo].split("/")[4]
    breed = Breed.where(name: breed_name)[0]

    binding.pry
    dog = Dog.create(breed_id: breed.id, photo: params[:photo], votes: 1, total_score: params[:score])

    render json: DogSerializer.new(dog)
  end

end
