require "minitest/autorun"

require "fixture_list_generator"

describe "Fixture List Generator" do
  before do
    @list = [1,2,3,4,5,6,7,8,9,10]
    @expected_number_of_fixtures = (@list.length-1)*2
  end

  it "must not be empty" do
    FixtureListGenerator::generate(@list).wont_be_nil
  end

  it "returns an array with a length of #{@expected_number_of_fixtures}" do
    result = FixtureListGenerator::generate(@list)
    result.count.must_equal @expected_number_of_fixtures
  end
end