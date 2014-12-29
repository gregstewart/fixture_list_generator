require "minitest/autorun"

require "fixture_list_generator/home_or_away"

describe "Home or Away" do
  before do
    @number_of_games = 4
    @home_or_away = HomeOrAway.new(@number_of_games)
  end

  it "returns a value between 1 and 0" do
    @home_or_away.determine.must_be_close_to 0,1
  end

  it "has an even number of home and away games" do
    @home_or_away.determine
    @home_or_away.determine
    @home_or_away.determine
    @home_or_away.determine
    @home_or_away.number_of_home_games.must_equal @number_of_games/2
    @home_or_away.number_of_away_games.must_equal @number_of_games/2
  end
end
