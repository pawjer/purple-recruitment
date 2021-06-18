
class FamilyLifeSimulation
  include PixelMultiplicationLogic

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
