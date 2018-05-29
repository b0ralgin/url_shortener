class UrlController < ApplicationController
  before_action :find_url, only: [:show]
  def index 
    render json: {}, status: 200
  end

  def show 
    redirect_to @url.long_url unless @url
    render status: 404
  end


  private 

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
  end
end
