require 'factory_girl'

Factory.define :product_category do |c|
  c.sequence(:name) { |n| "product_category#{n}" }
end

Factory.define :product do |p|
  product_category = ProductCategory.first || Factory(:product_category)
    p.sequence(:name) { |n| "product#{n}" }
    p.sequence(:description) { |n| "description for product#{n}" }
    p.price 9.99
    p.product_category product_category
end

