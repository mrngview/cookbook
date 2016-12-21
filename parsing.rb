require 'nokogiri'
require 'open-uri'

file = 'fraise.html'
doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')
recipes_elements = doc.css("div.m_titre_resultat > a") # Selects the element we want in the html document

recipes_elements.each do |recipes_element|
  puts recipes_element.text
end
