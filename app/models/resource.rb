class Resource < ActiveRecord::Base
  belongs_to :category
  belongs_to :state
  belongs_to :localization
  belongs_to :user

  has_and_belongs_to_many :accessories
  has_and_belongs_to_many :details

  has_many :loans

  validate :user_must_be_tutor_if_exists

  #validations

  def user_must_be_tutor_if_exists
    if has_responsible?
      unless user.tutor?
        errors.add(:user, 'User must be tutor')
      end
    end
  end

  def has_responsible?
    !!user
  end
end
