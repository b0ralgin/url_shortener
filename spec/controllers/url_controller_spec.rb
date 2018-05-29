require "rails_helper"

RSpec.describe UrlController, :type => :controller do
  describe "GET /" do
    it "should work" do
      get :index
      expect(response).to have_http_status(:ok)
    end 
  end
end