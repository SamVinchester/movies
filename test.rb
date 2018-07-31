require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open('http://imdb.com/title/tt0050083/?ref_=chttp_tt_5'))
divs = doc.css("div[class='txt-block']").text
#scan(/(?:[-a-z_\d])+@(?:[-a-z])*(?:\.[a-z]{2,4})+/)
budget = /Budget:.\d{1,3}.\d{1,3}.\d{1,3}/.match(divs)
File.open('tt0111161.html', 'w+') do |f|
  f.write budget
end