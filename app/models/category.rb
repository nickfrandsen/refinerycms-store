class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  def self.destroy_category(category_id)
    category = Category.find category_id
    category.destroy if category
    category
  end

end
