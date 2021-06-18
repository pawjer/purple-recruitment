require 'minitest/autorun'

class PixelsFamilyTest < Minitest::Test
  def test_initialization_default
    founders = [Pixel.new, Pixel.new]
    family = PixelsFamily.new(founders)
    expected_print = founders.map do |founder|
      [founder.r, founder.g, founder.b]
    end


    assert_equal 2, family.size
    assert_equal founders, family.founders
    assert_equal founders, family.members
    assert_equal expected_print, family.print
  end

  def test_initialization
    founders = [Pixel.new, Pixel.new, Pixel.new, Pixel.new]
    family = PixelsFamily.new(founders, replication_time: 1)

    assert_equal 4, family.size
    assert_equal 1, family.replication_time
  end

  def test_create_generation
    founders = [Pixel.new, Pixel.new]
    family = PixelsFamily.new(founders)

    assert_equal 2, family.size

    family.create_generation
    assert_equal 3, family.size

    family.create_generation
    assert_equal 4, family.size

    family.create_generation
    assert_equal 6, family.size

    family.create_generation
    assert_equal 9, family.size

    family.create_generation
    assert_equal 13, family.size
  end

  def test_inheritance
    founders = [Pixel.new(0, 1, 2), Pixel.new(2, 1, 0)]
    family = PixelsFamily.new(founders)

    assert_equal 2, family.size
    10.times { family.create_generation }

    assert_equal 94, family.size
    assert_equal family.print.flatten.uniq.sort, [0, 1, 2]
  end

  def test_inheritance_randomize
    # In the case when we need to test randomness I would use some kind of seed
    # to check if random method works correctly, atm it's just a simple assert_equal

    founders = [
      Pixel.new(0, 1, 2),
      Pixel.new(2, 1, 0),
      Pixel.new(3, 4, 5),
      Pixel.new(5, 3, 4)
    ]

    family = PixelsFamily.new(founders)

    assert_equal 4, family.size
    10.times { family.create_generation }

    assert_equal 211, family.size
    assert_equal family.print.flatten.uniq.sort, [0, 1, 2, 3, 4, 5]
  end
end
