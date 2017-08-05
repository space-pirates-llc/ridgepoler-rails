require 'test_helper'

class Ridgepole::Rails::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Ridgepole::Rails
  end
end
