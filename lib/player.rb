class Player
    attr_accessor :name, :life_points

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10
    end

    def show_state
        puts "                     #{name} has #{life_points} life points !"
    end

    def gets_damage(damage_to_save)
        @life_points -= damage_to_save.to_i

        if @life_points <= 0
            puts "#{name} is dead !"
        else
            puts "#{name} has now : #{life_points} life points left"
        end
    end

    def attacks(target)
        puts "\n\n#{name} attacks #{target.name} !\n\n" 
        damage = compute_damage
        puts "*********************************\n\n"
        puts "OH NO ! #{target.name} loose #{damage} life points...\n\n" 
        puts "*********************************\n\n"
        target.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level, :life_points

    def initialize(name_to_save)
        @name = name_to_save
        @weapon_level = 1
        @life_points = 100
    end

    def show_state
        puts "#{@name} has #{@life_points} life points and a weapon level #{@weapon_level} !"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "\n> You found a new weapon level #{new_weapon_level} !"
        gets.chomp
        if new_weapon_level > @weapon_level
            puts "\n> This weapon is so much better than your current one !"
            puts "\n(Press ENTER to take it)"
            gets.chomp
            @weapon_level=(new_weapon_level)
            puts "> The new weapon is now yours !"
            gets.chomp
        else
            puts "================================================================="
            puts "\n> This weapon is shit..."
            gets.chomp
            puts "\n(Press ENTER to throw it on the floor)"
            gets.chomp
            puts "> The shitty weapon now lies in the mud..."
            gets.chomp
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "================================================================="
            puts "\n\n> You found..... nothing"
            gets.chomp
        elsif health_pack == 2 || 3 || 4 || 5
            puts "================================================================="
            puts "\n\n> You found..... 50 life points !"
            @life_points + 50 >= 100 ? @life_points = 100 : @life_points += 50
            gets.chomp
            puts "\n\n> You now have #{@life_points} life points !"
            gets.chomp
        else health_pack == 6
            puts "================================================================="
            puts "\n\nYou found..... 80 life point !"
            @life_points + 80 >= 100 ? @life_points = 100 : @life_points += 80
            gets.chomp
            puts "\n\n> You now have #{@life_points} life points !"
            gets.chomp
        end 
    end
end
