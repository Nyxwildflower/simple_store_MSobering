require "csv"

# Reset the database when re-running the seed file.
Product.destroy_all
Category.destroy_all

# Q9: Create Fake products for the store.
# 676.times do
#   Product.create!(title: Faker::Commerce.product_name,
#                   price: Faker::Commerce.price,
#                   stock_quantity: Faker::Number.number(digits: 2))
# end

# Parse and read the csv file into a variable.
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

# Make the csv data readable by Ruby.
products = CSV.parse(csv_data, headers: true)

# Loop through the data to create new records.
products.each do |product|
  new_category = Category.find_or_create_by(name: product["category"])

  new_product = new_category.products.build(title: product["name"],
                                            description: product["description"],
                                            price: product["price"],
                                            stock_quantity: product["stock quantity"])

  new_product.save!
end