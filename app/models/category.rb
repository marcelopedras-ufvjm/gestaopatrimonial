class Category < ActiveRecord::Base


  belongs_to :parent_category, class_name: 'Category'

  has_many :accessories
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_category_id'

end
