
class Pixel
  def initialize(r,g,b)
    @r = r || random(255)
    @g = g || random(255)
    @b = b || random(255)
  end
end
