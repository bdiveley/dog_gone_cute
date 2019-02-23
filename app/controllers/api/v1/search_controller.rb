class Api::V1::SearchController < ApplicationController

  def index
    breed = Breed.where(name: params[:breed]).first

    dogs = Dog.find_dogs_by_breed(params[:order], breed.id)

    render json: DogSerializer.new(dogs)
  end
end
