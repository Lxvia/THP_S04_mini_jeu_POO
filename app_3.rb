require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "\n\n--------------------------------------------------------------
|                                                            |
|     Welcome to the game where (almost) everyone dies !     |
|         Try to be the last survivor... or die !            |
|                                                            |
-------------------------------------------------------------"
puts "\nWhat's you name ?"
print "\n> "
player1 = HumanPlayer.new("#{gets.chomp}")
puts "\nYour warrior has been saved ! Welcome to the game #{player1.name} !"
gets.chomp
puts "To wich game do you want to play ?"
puts "1. Easy = 10 ennemies"
puts "2. Less easy = 20 ennemies"
puts "3. Hard = 50 ennemies"
puts "4. Hardcore = 100 ennemies"
my_game = Game.new(player1)


#ABANDON