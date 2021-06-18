class FamilyLifeSimulation
  include PixelMultiplicationLogic

  attr_reader :family, :timerange

  def initialize(family, timerange)
    @family = family
    @timerange = timerange
  end

  def call
    raise 'Not implemented yet'
  end
end
