FactoryBot.define do
  factory :url do |f|
    f.long_url "http://google.com"
    f.short_url "aaa"
  end
end
