# frozen_string_literal: true

# PixelMultiplicationLogic contains additional logic for Pixels multiplication
# - it sets the way in which a family grows

module PixelMultiplicationLogic
  def multiply(parents)
    raise 'Arguments must be kind of Pixel' unless parents.all? { |parent| parent.kind_of? (Pixel) }
    raise 'There must be exactly 2 parents' if parents.size != 2

    parent_1 = parents.first
    parent_2 = parents.last

    Pixel.new(
      [parent_1.r, parent_2.r].sample,
      [parent_1.g, parent_2.g].sample,
      [parent_1.b, parent_2.b].sample
    )
  end
end
