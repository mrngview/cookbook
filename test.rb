require 'nokogiri'
require 'open-uri'

html_data = open('test.html').read
nokogiri_object = Nokogiri::HTML(html_data)
tagcloud_elements = nokogiri_object.css("ul.tagcloud > li > a")

p tagcloud_elements

tagcloud_elements.each do |tagcloud_element|
  puts tagcloud_element.text
end
