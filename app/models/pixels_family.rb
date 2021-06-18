
class PixelsFamily
  MAX_CYCLES = 100

  include PixelMultiplicationLogic

  attr_reader :founders, :replication_time, :members

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
