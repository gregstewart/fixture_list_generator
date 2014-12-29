class HomeOrAway
  attr :number_of_home_games, :number_of_away_games

  def initialize(games)
    @max_number_of_games = games/2
    @number_of_home_games = 0
    @number_of_away_games = 0
  end

  def determine
    # 0 is for away game, 1 is home game
    if @number_of_home_games == @max_number_of_games
      outcome = 0
    elsif      @number_of_away_games == @max_number_of_games
      outcome = 1
    else
      outcome = rand(0..1)
    end

    if(outcome == 1)
      @number_of_home_games += 1
    elsif
      @number_of_away_games += 1
    end

    outcome
  end
end