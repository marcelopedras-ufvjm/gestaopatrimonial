class Detail < ActiveRecord::Base
  belongs_to :resource
  belongs_to :detail_type
end
