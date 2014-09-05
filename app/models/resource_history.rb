class ResourceHistory < ActiveRecord::Base
  belongs_to :resource
  belongs_to :event_type
  belongs_to :localization
  belongs_to :loan


end
