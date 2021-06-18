require 'minitest/autorun'

class FamilyLifeSimulationTest < Minitest::Test
  def test_initialization_default
    founders = [Pixel.new, Pixel.new, Pixel.new]
    family = PixelsFamily.new(founders, replication_time: 20.seconds)
    fls = FamilyLifeSimulation.new(family, timerange: 1.hour)

    assert_equal family, fls.family
    assert_equal 1.hour, fls.timerange
    assert_equal false, fls.instance_variable_get(:@randomize)
    assert_equal 180, fls.instance_variable_get(:@cycles)
  end

  def test_runtime
    founders = [Pixel.new, Pixel.new, Pixel.new]
    family = PixelsFamily.new(founders, replication_time: 1.seconds)
    fls = FamilyLifeSimulation.new(family, timerange: 10.seconds)

    fls.call

    assert_equal 141, family.size
  end
end
