class User < ActiveRecord::Base
  has_many :resources
  has_many :loans

  def tutor?
    tutor
  end

  def admin
    admin
  end
end
