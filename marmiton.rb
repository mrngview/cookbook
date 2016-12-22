require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class Marmiton
  def search(ingredient)
    file = open("http://www.marmiton.org/recettes/recherche.aspx?s=#{ingredient}&type=all").read
    doc = Nokogiri::HTML(file)
    recipes = []
    doc.search(".m_contenu_resultat").each do |node|
      title = node.search(".m_titre_resultat > a").text
      time = node.search(".m_detail_time > div").text.strip
      recipe = Recipe.new(title, nil, nil)
      recipe.time = time
      recipes << recipe
    end
    return recipes
  end
end

