require "fixture_list_generator/version"

# All code in the gem is namespaced under this module.
module FixtureListGenerator
  def FixtureListGenerator.generate list
    number_of_fixtures  = (list.length-1)*2
    fixture_list = Array.new(number_of_fixtures) { Hash.new }



    fixture_list
  end
end
