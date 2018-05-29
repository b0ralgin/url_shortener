class Url < ApplicationRecord
  validates :long_url, presence: true, on: :create
  validates_format_of :long_url,
    with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_short_url
  def duplicates
    Url.find_by_long_url(self.long_url)
  end
  def new? 
    duplicates.nil?
  end

private 
 
def generate_short_url
  chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
  self.short_url = 6.times.map{chars.sample}.join
  self.short_url = 6.times.map{chars.sample}.join until Url.find_by_short_url(self.short_url).nil?
end

end