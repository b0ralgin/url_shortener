class UrlController < ApplicationController
  def index 
    render json: {}, status: 200
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])
    if @url
      redirect_to @url.long_url
    else
      render status: :not_found ,nothing: true
    end
  end

  def create 
  end

end
