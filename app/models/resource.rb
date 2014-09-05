class Resource < ActiveRecord::Base
  belongs_to :category
  belongs_to :state
  belongs_to :localization
  belongs_to :user

  has_many :accessories
  has_many :details

  validate :user_must_be_tutor_if_exists

  #validations

  def user_must_be_tutor_if_exists
    if has_responsible?
      unless user.tutor?
        errors.add(:user, 'User most be tutor')
      end
    end
  end

  def has_responsible?
    !!user
  end
end
