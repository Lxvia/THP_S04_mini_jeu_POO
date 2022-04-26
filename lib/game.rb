class game
    attr_accessor :human_player, :ennemies, :players_left

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        @ennemies = []
    end

    def kill_player(enemy)
        @ennemies.delete(@ennemies[enemy.to_i])

    end

    def is_still_ongoing?
        @human_player.life_points > 0 && @players_left > 0
    end

    def show_players
        puts "#{@human_player.show_state}"
        gets.chomp
        puts "There is #{@players_left} ennemies !"
    end

    def menu
        gets.chomp
        puts "================================================================="
        self.show_players
        puts "================================================================="
        puts "\n\nWhat do you want to do ?"
        puts "\nw -> Look for a better weapon"
        puts "h -> Look for a health kit"

        puts "\n\nAttack a player in sight ?"
        i = 0
        @ennemies.each_do |enemy|
        if enemy.life_points > 0
            puts "#{i}. #{enemy.name} with #{enemy.life_points} life points"
        end
        i += 1
        puts "\n================================================================="
        puts 
    end

    def menu_choice(choice)
        if choice == ""
            puts "\nWrong command, be more careful or you will die..."
            gets.chomp
        end
        elsif choice == "w"
            @human_player.search_weapon
            gets.chomp
        elsif choice == "h"
            @human_player.search_health_pack
            gets.chomp
        elsif (choice.to_i >= 0 && choice.to_i < @ennemies.size) && @ennemies[choice.to_i].life_points > 0
            puts "\n#{@human_player.name} attacks !"
            @human_player.attacks(@ennemies[choice.to_i])
            gets.chomp
            if @ennemies[choice.to_i].life_points <= 0
                kill_player(choice.to_i)
            end
        else
            puts "\n Wrong command, be more careful or you will die..."
            gets.chomp
    end

    def enemies_attack
        if @players_left > 0
            @ennemies.each do |enemy|
                if enemy.life_points > 0 && @human_player.life_points > 0
                    enemy.attacks(@human_player)
                end
            end
        else
            puts "#{@human_player.name} killed every player !"
        end
    end

    def end
        if @human_player.life_points > 0
            puts "\n================================================================="
            puts "#{@human_player.name} wins the game !!!!! Congrats !"
        else
            puts "\n================================================================="
            put "#{@human_player.name} got killed.... u suck"
        end
    end

end