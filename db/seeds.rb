# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

category_keys = {}

category_keys["9"] = "Astronomija"
category_keys["10"] = "Biologija"
category_keys["11"] = "Chemija"
category_keys["12"] = "Ekonomika"
category_keys["13"] = "Filologija"
category_keys["14"] = "Filosofija"
category_keys["15"] = "Fizika"
category_keys["16"] = "Geografija"
category_keys["17"] = "Informatika"
category_keys["18"] = "Istorija"
category_keys["19"] = "Matematika"
category_keys["20"] = "Kita"
category_keys["21"] = "Oranžiniai"
category_keys["22"] = "Ne imti bet duoti"
category_keys["23"] = "LGMO"

$categories = {}

category_keys.each do |key, value|
  $categories[key] = Category.create(name: value)
end

def get_category(id)
  if $categories.key?(id.to_s)
    $categories[id.to_s]
  else
    nil
  end
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'olimpiados.lt.content.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1', :col_sep => " ", :quote_char => "|")

csv.each do |row|
  article = row.to_hash
  a = Article.create(title: article["title"], content: article["text"])
  if get_category(article["catid"])
    get_category(article["catid"]).articles << a
  end
end