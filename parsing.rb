require 'nokogiri'
require 'open-uri'

html_data = open('http://www.marmiton.org/recettes/recherche.aspx?s=fraise&type=all').read
nokogiri_object = Nokogiri::HTML(html_data)
