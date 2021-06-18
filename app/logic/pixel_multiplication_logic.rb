
module PixelMultiplicationLogic
  def multiply(parents)
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
