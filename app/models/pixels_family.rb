# frozen_string_literal: true

# Pixels Family represents a whole population of immortal pixels.
# You need to point the founders of Family - there should be at least two of them, each of kind of Pixel
# :replication_time is a param that sets the virtual time of creating new generation
# Create PixelsFamily with:
#   PixelsFamily.new([Pixel, Pixel], replication_time: )
# To create a new generation you can use both:
# - sorted family members array:
#     family = PixelsFamily.new([Pixel, Pixel], replication_time: )
#     family.create_generation
# - or randomized one:
#     family = PixelsFamily.new([Pixel, Pixel], replication_time: )
#     family.create_generation(randomize: true)
# Use :family_size to get members count
# Use :print to get an array of arrays of pixles

class PixelsFamily
  MAX_CYCLES = 100

  include PixelMultiplicationLogic

  attr_reader :founders, :replication_time

  def initialize(founders, replication_time: 5)
    raise 'There should be at least two Pixels to start the family' if founders.size < 2

    @members = [founders].flatten
    @founders = founders
    @replication_time = replication_time
  end

  def create_generation(randomize: false)
    current_generation = randomize ? @members.shuffle.dup : @members.dup

    current_generation.each_slice(2) do |parents|
      next if parents.size != 2

      add_member(multiply(parents))
    end
    @members
  end

  def family_size
    @members.size
  end

  def print
    @members.map { |pixel| [pixel.r, pixel.g, pixel.b] }
  end

  private

  def add_member(pixel)
    @members << pixel
    @members.flatten!
  end
end
