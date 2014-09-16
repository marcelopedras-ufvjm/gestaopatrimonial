class User < ActiveRecord::Base
  has_secure_password

  has_many :resources
  has_many :loans

  #validations

  validates_presence_of :name, :email
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  #format '(00) 0000-0000' or '(11) 90000-0000' or ''
  validates_format_of :phone, with: /\A\z|(\A(\(11\) [9][0-9]{4}-[0-9]{4})|(\(1[2-9]\) [5-9][0-9]{3}-[0-9]{4})|(\([2-9][1-9]\) [5-9][0-9]{3}-[0-9]{4})\z)/
  validates_uniqueness_of :email

  scope :tutors, -> {where(tutor: true)}
  scope :admins, -> {where(admin: true)}
  scope :commons,-> {where(tutor: true, admin: true)}

  def tutor?
    tutor
  end

  def admin?
    admin
  end

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
