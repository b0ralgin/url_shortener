# frozen_string_literal: true

# Controller to make short URL
class UrlController < ApplicationController
  def index
    render json: {}, status: 200
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])
    if @url
      redirect_to @url.long_url
    else
      render status: :not_found, nothing: true
    end
  end

  def create
    @url = Url.new(url_params)
    if @url.new?
      if @url.save
        redirect_to @url.short_url
      else
        render json: { error: 'cannot save link' }, status: :bad_request
      end

    else
      redirect_to @url.duplicates.short_url
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
