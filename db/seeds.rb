5.times do |n|
  name = Faker::Name.name
  Category.create!(name: name)
end

10.times do |n|
  name = Faker::Food.ingredient
  price = (Random.rand(100000) / 100) * 100
  descriptions = Faker::Lorem.paragraph
  category_id = Random.rand(5) + 1
  average_point = Random.rand(5) + 1
  Product.create!(name: name, price: price, descriptions: descriptions, 
    category_id: category_id, average_point: average_point)
end
