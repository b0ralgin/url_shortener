class UrlController < ApplicationController

  def index 
    render json: {}, status: 200
  end

  def show 
    render json: {}, status: 404
  end
end
