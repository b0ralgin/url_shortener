require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is invalid without a url' do
    url = build(:url, long_url: nil)
    expect(url.valid?).not_to be true
  end
  it 'is valid with a url' do
    url = build(:url)
    expect(url.valid?).to be true
  end

  it 'is invalid with  an invalid url' do
    url = build(:url, long_url: 'abc')
    expect(url.valid?).not_to be true
  end

  describe 'short_url' do
    before :each do
      @url_google = create(:url)
      @url_google.save
    end
    it 'should get 6 letters as a short_url' do
      url = build(:url)
      url.save
      expect(url.short_url).to match(/\A[a-z\d]{6}\z/i)
    end
    it 'should get 6 letters as a short_url' do
      url = build(:url)
      url.save
      expect(url.short_url).to match(/\A[a-z\d]{6}\z/i)
    end
    it '#duplicates finds a duplicate' do
      url = build(:url)
      expect(url.duplicates).to eq @url_google
    end

    it '#new? false if there is no url in DB' do
      url = build(:url, long_url: 'http://ya.ru')
      expect(url.new?).to eq true
    end

    it '#new? false if url exists in DB' do
      url = build(:url)
      expect(url.new?).to eq false
    end
  end
end
