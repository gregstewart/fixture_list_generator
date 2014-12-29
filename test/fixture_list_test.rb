require "minitest/autorun"

require "fixture_list_generator"

describe "Fixture List Generator" do
  before do
    @list = [1,2,3,4]
    @expected_number_of_fixture_weeks = (@list.length-1)*2
    @expected_number_of_games_per_week = @list.length/2
  end

  it "must not be empty" do
    generated_fixture_list = FixtureListGenerator::generate(@list)
    generated_fixture_list.wont_be_nil
  end

  it "returns an array with a length of #{@expected_number_of_fixture_weeks}" do
    generated_fixture_list = FixtureListGenerator::generate(@list)
    generated_fixture_list.count.must_equal @expected_number_of_fixture_weeks
  end

  describe "each team" do
    it "plays an even number of home and away games" do
      generated_fixture_list = FixtureListGenerator::generate(@list)
      team_one_match_count = { :away => 0, :home => 0 }
      team_two_match_count =  { :away => 0, :home => 0 }
      team_three_match_count =  { :away => 0, :home => 0 }
      team_four_match_count =  { :away => 0, :home => 0 }
      generated_fixture_list.each do | week |
        week["matches"].each do | match |
          if match[:home] == 1
            team_one_match_count[:home] += 1
          elsif match[:away] == 1
            team_one_match_count[:away] += 1
          end

          if match[:home] == 2
            team_two_match_count[:home] += 1
          elsif match[:away] == 2
            team_two_match_count[:away] += 1
          end

          if match[:home] == 3
            team_three_match_count[:home] += 1
          elsif match[:away] == 3
            team_three_match_count[:away] += 1
          end

          if match[:home] == 4
            team_four_match_count[:home] += 1
          elsif match[:away] == 4
            team_four_match_count[:away] += 1
          end
        end
      end

      games_to_be_played = @expected_number_of_fixture_weeks/2
      team_one_match_count[:home].must_equal games_to_be_played
      team_one_match_count[:away].must_equal games_to_be_played
      team_two_match_count[:home].must_equal games_to_be_played
      team_two_match_count[:away].must_equal games_to_be_played
      team_three_match_count[:home].must_equal games_to_be_played
      team_three_match_count[:away].must_equal games_to_be_played
      team_four_match_count[:home].must_equal games_to_be_played
      team_four_match_count[:away].must_equal games_to_be_played
    end
  end

  describe "each week" do
    it "has a #{@expected_number_of_games_per_week}" do
      generated_fixture_list = FixtureListGenerator::generate(@list)
      generated_fixture_list[0]["matches"].length.must_equal @expected_number_of_games_per_week
      generated_fixture_list[1]["matches"].length.must_equal @expected_number_of_games_per_week
      generated_fixture_list[2]["matches"].length.must_equal @expected_number_of_games_per_week
      generated_fixture_list[3]["matches"].length.must_equal @expected_number_of_games_per_week
      generated_fixture_list[4]["matches"].length.must_equal @expected_number_of_games_per_week
      generated_fixture_list[5]["matches"].length.must_equal @expected_number_of_games_per_week
    end

  end
end