class Url < ApplicationRecord
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