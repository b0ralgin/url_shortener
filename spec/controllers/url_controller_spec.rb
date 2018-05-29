require "rails_helper"

RSpec.describe UrlController, :type => :controller do
  describe "GET index" do
    it "should get status OK" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET show" do
    before :each do
      @url = create(:url, short_url: 'aaa')
      
    end

    it "should get full URL" do 
      get :show, params: { short_url: @url.short_url}
      expect(assigns(:url)).to eq @url
      expect(response).to redirect_to(@url.long_url)
    end

    it "should get Not found" do 
      get :show, params: { short_url: @url.short_url+'a'}
      expect(response).to have_http_status(:not_found)
    end

  end

  describe "POST create" do
    context "with valid params" do
      context "with new url" do 
        it "creates a new url" do
          expect{
            post :create, params: { url: attributes_for(:url) }
          }.to change(Url, :count).by(1)
        end
        it "redirects to new link" do
          post :create, params: { url: attributes_for(:url) }
          expect(response).to redirect_to(assigns[:url].short_url)
        end
      end
    end


   
  end
end