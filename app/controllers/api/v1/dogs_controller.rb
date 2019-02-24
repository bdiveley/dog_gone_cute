class Api::V1::DogsController < ApplicationController

  def index
    dogs = Dog.find_dogs(params[:order])
    render json: DogSerializer.new(dogs)
  end

  def create
    breed = Breed.find_or_create_by(name: breed_name)
    dog = Dog.find_or_create_by(photo: params[:photo])

    if dog.id
      update_dog(dog)
    else
      dog = create_dog(breed)
    end
    render json: DogSerializer.new(dog)
  end

private

  def breed_name
    params[:photo].split("/")[4]
  end

  def update_dog(dog)
    dog.update(votes: dog.votes += 1, total_score: dog.total_score + params[:score].to_i)
  end

  def create_dog(breed)
    Dog.create(breed_id: breed.id, photo: params[:photo], votes: 1, total_score: params[:score])
  end

end
