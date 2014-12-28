require "minitest/autorun"

require "fixture_list_generator"

class FixtureListTest < Minitest::Unit::TestCase
  def test_url
    assert_equal true, FixtureListGenerator::Dummy
  end
end