# frozen_string_literal: true

# Pixel is a member of recently discovered species of microorganisms.
# It can be initialized with the specified gems of R, G, B:
#   Pixel.new(r, g, b), where each of them is in range 0..255
# or by letting the system to initialize it with random values:
#   Pixel.new

class Pixel
  attr_reader :r, :g, :b

  def initialize(r = nil, g = nil, b = nil)
    raise 'Arguments need to be in range [0,255]' unless [r, g, b].compact.all? { |gen| gen.between?(0, 255) }

    @r = r || rand(255)
    @g = g || rand(255)
    @b = b || rand(255)
  end
end
