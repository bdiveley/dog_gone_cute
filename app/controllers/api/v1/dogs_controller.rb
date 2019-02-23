class Api::V1::DogsController < ApplicationController

  def index
    dogs = Dog.cutest_dogs
    render json: DogSerializer.new(dogs)
  end

end
