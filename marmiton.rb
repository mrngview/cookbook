require 'nokogiri'
require 'open-uri'

class Marmiton
  def search(ingredient)
    file = open("http://www.marmiton.org/recettes/recherche.aspx?s=#{ingredient}&type=all").read
    doc = Nokogiri::HTML(file)
    recipes_elements = doc.css("div.m_titre_resultat > a") # Selects the element we want in the html document

    recipes_elements.each do |recipes_element|
      puts recipes_element.text
    end
  end
end

