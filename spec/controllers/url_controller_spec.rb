require "rails_helper"

RSpec.describe UrlController, :type => :controller do
  describe "GET index" do
    it "should get status OK" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET show" do
    it "should fail when GET unknown url" do
      get :show, params: { short_url: 'aaa' }
      expect(response).to have_http_status(:not_found)
    end

    before do
      @url = create(:url)
    end
    it "should get full URL" do 
      get :show, params: { short_url: @url.short_url}
      expect(assigns(:url)).to eq @url
    end
  end
end