require 'rails_helper'

RSpec.describe Url, type: :model do
  it "is invalid without a url" do
    url = build(:url, long_url: nil)
    expect(url.valid?).not_to be true
  end
  it "is valid with a url" do
    url = build(:url)
    expect(url.valid?).to be true
  end

  it "is invalid with  an invalid url" do
    url = build(:url, long_url: "abc")
    expect(url.valid?).not_to be true
  end
end
