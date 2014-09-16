require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  test "valid loan" do
    loan = loans(:loan);
    assert(loan.valid?)
  end

  test "end date must be greather than start date on devolution" do
    loan = loans(:loan);
    loan.end = loan.start - 1.day
    assert_equal(false, loan.valid?)
  end

  test "devolution forecast date must be greather than start date on loan" do
    loan = loans(:loan);
    loan.start = loan.devolution_forecast + 1.day
    assert_equal(false, loan.valid?)
  end

  test "start and devolution forecast date must be exist to loan" do
    loan = loans(:loan)
    loan.start = nil
    assert_equal(false, loan.valid?)

    loan = loans(:loan)
    loan.end = nil
    assert_equal(false, loan.valid?)
  end

  test "start and end date must be present to booking" do
    booking = loans(:booking)
    assert(booking.valid?)

    booking.start = nil
    assert_equal(false, booking.valid?)

    booking = loans(:booking)
    booking.end = nil
    assert_equal(false, booking.valid?)
  end

  test "loan must have a user" do
    loan = loans(:loan)
    loan.user = nil
    assert_equal(false, loan.valid?)
  end

  test "loan must have a resource" do
    loan = loans(:loan)
    loan.resource = nil
    assert_equal(false, loan.valid?)
  end
end
