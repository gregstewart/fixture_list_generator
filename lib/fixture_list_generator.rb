require "fixture_list_generator/version"

# All code in the gem is namespaced under this module.
module FixtureListGenerator
  def FixtureListGenerator.generate array_of_teams
    number_of_fixtures  = (array_of_teams.length-1)*2
    fixtures = Array.new(number_of_fixtures) { {"week" => nil, "matches" => []} }
    duplicate_array_of_teams = array_of_teams.dup
    matches = []

    fixtures.map.with_index do |week, i|
      week["week"] = i+1
    end


    while !duplicate_array_of_teams.empty? do
      current_team = duplicate_array_of_teams.pop

      array_of_teams.each do |opponent|
        if opponent != current_team

          match_hash = {"home" => current_team, "away" => opponent}
          matches.push match_hash
        end
      end
    end

    current_team
    start_index = 0
    end_index = number_of_fixtures-1
    while !matches.empty? do
      home_leg = matches.shift()
      away_leg = matches.pop()

      if current_team != home_leg["home"]
        current_team = home_leg["home"]
        start_index = 0
        end_index = number_of_fixtures-1
      end

      fixtures[start_index]["matches"].push(home_leg)
      fixtures[end_index]["matches"].push(away_leg)

      start_index += 1
      end_index -= 1
    end

    fixtures
  end
end
