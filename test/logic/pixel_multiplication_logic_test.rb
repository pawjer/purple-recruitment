require 'minitest/autorun'

class PixelMultiplicationLogicTest < Minitest::Test
  include PixelMultiplicationLogic
  def test_guards
    assert_raises do
      multiply
    end

    assert_raises do
      multiply([Pixel.new])
    end

    assert_raises do
      multiply([Pixel.new, Pixel.new, Pixel.new])
    end

    assert_raises do
      multiply('a', 'b')
    end
  end

  def test_multiply
    parents = [Pixel.new, Pixel.new]

    pixel = multiply(parents)

    assert pixel.r.in? parents.map(&:r)
    assert pixel.g.in? parents.map(&:g)
    assert pixel.b.in? parents.map(&:b)
  end
end
