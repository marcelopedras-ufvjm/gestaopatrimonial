require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'responsible for resource must be tutor' do
    printer = resources(:large_printer_hp)
    printer.user = users(:user1)
    assert_equal(false, printer.valid?)
    printer.user = users(:tutor)
    assert(printer.valid?)
  end

  test 'is not mandatory that a resource has a tutor' do
    printer = resources(:large_printer_hp)
    printer.user = nil
    assert(printer.valid?)
  end

  test 'name is mandatory' do
    pc = resources(:hp3000)
    pc.name = ""
    assert_equal(false, pc.valid?)
  end

  test 'category is mandatory' do
    pc = resources(:hp3000)
    pc.category = nil
    assert_equal(false, pc.valid?)
  end

  test 'state is mandatory' do
    pc = resources(:hp3000)
    pc.state = nil
    assert_equal(false, pc.valid?)
  end

  test 'localization is mandatory' do
    pc = resources(:hp3000)
    pc.localization = nil
    assert_equal(false, pc.valid?)
  end
end
