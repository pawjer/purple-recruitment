
class Pixel
  attr_reader :r, :g, :b

  def initialize(r = nil, g = nil, b = nil)
    raise 'Arguments need to be in range [0,255]' unless [r, g, b].all? { |gen| gen.between?(0,255) }

    @r = r || rand(255)
    @g = g || rand(255)
    @b = b || rand(255)
  end
end
