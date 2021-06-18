require_relative 'config/environment'

initial_family_size = 0

puts 'Welcome to Pixels Family Growth Simulation'
unless initial_family_size.to_i >= 2
  puts 'How much Pixels should be Family founders? Must be at least 2 members. [default: 2]'
  resp = gets.chomp
  initial_family_size = resp.blank? ? 2 : resp.to_i
end

puts 'What should be family replication time? [default: 5]'
resp = gets.chomp
replication_time = resp.blank? ? 5 : resp.to_i

puts 'What time range should we simulate? [default: 100]'
resp = gets.chomp
simulation_duration = resp.blank? ? 100 : resp.to_i

puts 'Do you want to use additional randomization? [yes/no, default: no]'
randomize = gets.chomp.downcase == 'yes'

puts 'Script will run with those arguments:'
puts "initial_family_size: #{initial_family_size}"
puts "replication_time:    #{replication_time}"
puts "simulation_duration: #{simulation_duration}"
puts "randomize:           #{randomize}"

founders = []
initial_family_size.to_i.times { founders << Pixel.new }
family = PixelsFamily.new(founders, replication_time: replication_time.to_i)

FamilyLifeSimulation.new(family, timerange: simulation_duration.to_i, randomize: randomize).call
pp family.print
