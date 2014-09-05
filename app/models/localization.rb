class Localization < ActiveRecord::Base
  belongs_to :building

  has_many :resources
  has_many :resource_histories
end
