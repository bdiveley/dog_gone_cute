class ApplicationController < ActionController::API

  def order
    if params[:order]
      return params[:order]
    else
      return "desc"
    end
  end
  
end
