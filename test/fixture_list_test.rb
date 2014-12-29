require "minitest/autorun"

require "fixture_list_generator"

describe "Fixture List Generator" do
  before do
    @list = [1,2,3,4]
    @expected_number_of_fixture_weeks = (@list.length-1)*2
    @expected_number_of_games_per_week = @list.length/2
  end

  it "must not be empty" do
    skip
    generated_fixture_list = FixtureListGenerator::generate(@list)
    generated_fixture_list.wont_be_nil
  end

  it "returns an array with a length of #{@expected_number_of_fixture_weeks}" do
    skip
    generated_fixture_list = FixtureListGenerator::generate(@list)
    generated_fixture_list.count.must_equal @expected_number_of_fixture_weeks
  end

  describe "each week" do
    it "has a #{@expected_number_of_games_per_week}" do
      generated_fixture_list = FixtureListGenerator::generate(@list)
      puts generated_fixture_list
      generated_fixture_list[0]['matches'].length.must_equal @expected_number_of_games_per_week
    end
  end
end