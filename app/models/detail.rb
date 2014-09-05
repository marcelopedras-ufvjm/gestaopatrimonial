class Detail < ActiveRecord::Base
  has_and_belongs_to_many :resources
  belongs_to :detail_type
end
