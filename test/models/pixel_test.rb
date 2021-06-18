require 'minitest/autorun'

class PixelTest < Minitest::Test
  def test_pixel_initialization_default
    pixel = Pixel.new

    assert_kind_of Numeric, pixel.r
    assert_kind_of Numeric, pixel.g
    assert_kind_of Numeric, pixel.b

    assert pixel.r.between?(0, 255)
    assert pixel.g.between?(0, 255)
    assert pixel.b.between?(0, 255)
  end

  def test_pixel_initialization
    assert_raises do
      Pixel.new(1000, 200 ,-1)
    end

    assert_raises do
      Pixel.new('a', 'b','c')
    end
  end
end
