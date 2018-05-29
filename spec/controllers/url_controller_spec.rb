require "rails_helper"

RSpec.describe UrlController, :type => :controller do
  describe "Index" do
    it "should work" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "URL" do
   it "should fail when GET url" do
    get :long
    expect(response).to have_http_status(:not_found)
   end
  end
end