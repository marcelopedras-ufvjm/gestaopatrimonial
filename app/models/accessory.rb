class Accessory < ActiveRecord::Base
  has_and_belongs_to_many :resources
  belongs_to :category
end
