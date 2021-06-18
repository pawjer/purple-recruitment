# frozen_string_literal: true

# FamilyLifeSimulation simulates a PixelsFamily growth through the time. Counts the cycles depend on the given
# time range and family.replication time
# Use the service to check the family after a given time:
#  FamilyLifeSimulation.new(PixelsFamily, timerange:, randomize:)
#     - PixelsFamliy is a PixelsFamily object
#     - timerange is a range of a time ex: 2.minutes
#     - randomize is a boolean that adds additional randomization to the family growth process
#       [check in the PixelsFamily model]

class FamilyLifeSimulation
  attr_reader :family, :timerange

  def initialize(family, timerange:, randomize: true)
    @family = family
    @timerange = timerange
    @randomize = randomize
    @cycles = timerange / family.replication_time
  end

  def call
    puts "There will be #{@cycles} cycles"

    @cycles.times do |i|
      family.create_generation(randomize: @randomize)

      printf("\rProgress: [%-100s]", '=' * (i / (@cycles / 100.0)))
    end
    printf("\rProgress: [%-100s]", '=' * 100)

    family
  end
end
