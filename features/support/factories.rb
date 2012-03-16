require 'factory_girl'

Factory.define :category do |c|
  c.sequence(:name) { |n| "category#{n}" }
end

Factory.define :product do |p|
  brand = Brand.first || Factory(:brand)
  category = Category.first || Factory(:category)
    p.sequence(:name) { |n| "product#{n}" }
    p.sequence(:description) { |n| "description for product#{n}" }
    p.price 9.99
    p.category category
end

