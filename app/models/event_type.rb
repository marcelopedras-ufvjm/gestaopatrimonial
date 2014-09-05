class EventType < ActiveRecord::Base

  has_many :resource_histories
end
