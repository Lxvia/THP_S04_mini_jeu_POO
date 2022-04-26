require 'pry'
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
ennemies = []
ennemies << player2 = Player.new("Josiane") 
ennemies << player3 = Player.new("José")

while player1.life_points >0 && (player2.life_points > 0 || player3.life_points > 0)
    puts "\n#{player1.show_state}"
    gets.chomp
    puts "================================================================="
    puts "\n\nWhat do you want to do ?"
    puts "\nw -> Look for a better weapon"
    puts "h -> Look for a health kit"

    puts "\n\nAttack another player :"
    puts "\n2 ->#{player2.show_state}"
    puts "3 ->#{player3.show_state}"

    puts "\n\n(Enter the command you want to execute)"
    choice = gets.chomp.to_s
    case choice
    when choice = "w" 
        player1.search_weapon
    when choice = "h" 
        player1.search_health_pack
    when choice = "2"
        player1.attacks(player2)
    when choice = "3"
        player1.attacks(player3)
    else
        puts "Wrong command, be more careful or you will die..."
    end


    puts "\n\nIt's the other players turn to play"
    gets.chomp 
    ennemies.each do | player |
        if player.life_points > 0
            player.attacks(player1)
            gets.chomp
        end
    end
end

puts ">>>>>>>>>>>>> GAME OVER <<<<<<<<<<<<<<<"

if player1.life_points > 0
    puts "\n\nCongrats ! You're the last survivor !"
else 
    puts "\n\nYou're dead....."
end

binding.pry




