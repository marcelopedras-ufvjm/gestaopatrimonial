require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'authenticate' do
    user = users(:user1)
    assert(user.authenticate('123'))
    assert_equal(false, user.authenticate('fasdg'))
  end

  test 'email must be unique' do
    user = users(:user1)
    user2 = User.new
    user2.name = 'Ze'
    user2.email = user.email
    user2.password = 'abc'
    user2.password_confirmation = 'abc'

    assert_raise ActiveRecord::RecordInvalid do
      user2.save!
    end
  end

  test 'email cannot be empty' do
    user = users(:user1)
    user.email = ''
    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test 'email must be valid' do
    user = User.new
    user.name = 'Ze'
    user.email = 'j.gmail.com'
    user.password = 'abc'
    user.password_confirmation = 'abc'

    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test 'phone must be valid' do
    user = users(:user1)

    user.phone =  ''
    assert(user.valid?)

    user.phone = '(38) 9925-1223'
    assert(user.valid?)

    user.phone = '(11) 99925-9824'
    assert(user.valid?)

    user.phone = '312 88136758'
    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end
end
