require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "\n======================================================================="
sleep 0.5
puts "\n                              Welcome,"
sleep 0.5
puts "\n  To the game where someone will surely die in a short amout of time\n"
sleep 0.5
puts "\n======================================================================="
sleep 0.5
player1 = Player.new("Josiane")
puts "\n          The first warrior to enter the game is Josiane !!!\n"
puts player1.show_state
sleep 0.5
player2 = Player.new("José")
puts "\n         Now make some noise for our second warrior, José !!!"
puts player2.show_state
sleep 0.5
puts "\n======================================================================="
sleep 0.5
puts "\n                  (Press ENTER to start the game)"
gets.chomp

puts "\n             Ladies first, Josiane can start the game !"

while player1.life_points > 0 && player2.life_points > 0
    player1.attacks(player2)
    break if player2.life_points <= 0
    player2.attacks(player1)
    break if player1.life_points <= 0
end



binding.pry