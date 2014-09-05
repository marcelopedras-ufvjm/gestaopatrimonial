class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource

  has_many :resource_histories
end
