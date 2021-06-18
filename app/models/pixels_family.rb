
class PixelsFamily
  MAX_CYCLES = 100

  def initialize(founders, replication_time: 5)
    raise 'There should be at least two Pixels to start the family' if founders.size < 2

    @founders = founders
    @replication_time = replication_time
  end
end
