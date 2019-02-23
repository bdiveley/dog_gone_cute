class Api::V1::DogsController < ApplicationController

  def index
    dogs = Dog.find_dogs(params[:order])
    render json: DogSerializer.new(dogs)
  end

end
