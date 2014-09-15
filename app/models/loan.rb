class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource

  has_many :resource_histories

  validates_presence_of :user, :resource
  validate :devolution_forecast_greater_than_start_date,
           :end_date_greater_than_start_date,
           :start_and_devolution_forecast_must_be_exist_to_loan,
           :start_and_end_date_must_be_present_to_booking

  def booking?
    booking
  end

  def loan?
    !booking?
  end

  def returned?
    booking? ? false : !self.end.nil?
  end

  #custom validations

  def devolution_forecast_greater_than_start_date
    if !devolution_forecast.nil? && !start.nil?
      if self.devolution_forecast <= self.start
        errors.add(:loan, "Devolution forecast must be greater than start date")
      end
    end
end

  def end_date_greater_than_start_date
    if !self.start.nil? && !self.end.nil?
      if self.end <= self.start
        errors.add(:loan, "End date must be greater than start date")
      end
    end
  end

  def start_and_devolution_forecast_must_be_exist_to_loan
    if loan?
      unless self.start
        errors.add(:loan, "Start date must be present to loan")
      end

      unless self.devolution_forecast
        errors.add(:loan, "Devolution forecast must be present to loan")
      end
    end
  end

  def start_and_end_date_must_be_present_to_booking
    if booking?
      unless self.start
        errors.add(:loan, "Start date must be present to booking")
      end

      unless self.end
        errors.add(:loan, "End date must be present to booking")
      end
    end
  end
end
