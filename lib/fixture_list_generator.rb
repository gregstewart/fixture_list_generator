require "fixture_list_generator/version"
require "fixture_list_generator/home_or_away"

# All code in the gem is namespaced under this module.
module FixtureListGenerator
  def FixtureListGenerator.generate array_of_teams
    number_of_fixtures  = (array_of_teams.length-1)*2
    fixtures = Array.new(number_of_fixtures) { {"week" => nil, "matches" => []} }

    build_fixtures_collection(array_of_teams, fixtures)

    matches = build_team_matches_for_the_season(array_of_teams)

    populate_fixtures_from_matches(fixtures, matches)

    fixtures
  end

  def self.populate_fixtures_from_matches(fixtures, matches)
    while !matches.empty? do
      current_match = matches.pop

      set_fixture(current_match, fixtures)
    end
  end

  def self.build_team_matches_for_the_season(array_of_teams)
    duplicate_array_of_teams = array_of_teams.dup
    matches = []
    while !duplicate_array_of_teams.empty? do
      current_team = duplicate_array_of_teams.pop

      array_of_teams.each do |opponent|
        if opponent != current_team

          match_hash = {:home => current_team, :away => opponent}
          matches.push match_hash
        end
      end
    end
    matches
  end

  def self.build_fixtures_collection(array_of_teams, fixtures)
    fixtures.map.with_index do |week, i|
      week["week"] = i+1
      week["matches"] = Array.new(array_of_teams.length/2) { {:home => nil, :away => nil} }
    end
  end

  def self.set_fixture(current_match, fixtures)
    unless has_match_been_played fixtures, current_match
      fixtures.each do |fixture|
        unless has_team_played_this_week fixture["matches"], current_match
          fixture["matches"].each do |match|

            if match[:home].nil?
              match[:home] = current_match[:home]
              match[:away] = current_match[:away]
              return
            end
          end
        end
      end
    end
  end

  def self.has_match_been_played(fixtures, current_match)
    match_has_been_played = false
    fixtures.each do | fixture |
      fixture["matches"].each do |match|

        if match == current_match
          puts "#{match == current_match}"
          match_has_been_played = true
        end
      end
    end

    match_has_been_played
  end

  def self.has_team_played_this_week(matches, current_match)
    team_has_played = false
    matches.each do |match|
      if match[:home] == current_match[:home] || match[:away] == current_match[:away] || match[:home] == current_match[:away] || match[:away] == current_match[:home]
        team_has_played = true
      end
    end

    team_has_played
  end
end
