#####################################################
#####################################################
########        Ruby Adventure Game
######## 1. is the player alive
######## 2. let player leave room
######## 3. check if monster is in room
######## 4. allowing search of treasure
######## 5. different types of rooms
######## 6. RNG
######## 7. did we find treasure? name treasure
########8. monsters deal damage - heal to zero = game over
#####################################################
#####################################################

def create_room
  "You are in a room. You see a door..."
end

def treasure
  ["emerald","ruby","soulsilver","heartgold","moon", "sun", "platinum", "diamond", "pearl", "crystal", "red", "blue"].sample
end

### RNG Generator of DOOM ###
def roll_dice(number_of_dice, size_of_dice)
  total = 0
  1.upto(number_of_dice) do
      total = total + rand(size_of_dice) + 1
  end
  return total
end
############ DICE ROLLS ####################
def has_monster?
        if roll_dice(2, 6) >= 8
            true
        else 
            false
        end
    end
def has_escaped?
  if roll_dice(2, 6) >= 11
    true
  else
    false
  end
end
def monster_attack?
  if roll_dice(2, 6) >= 2
    true
  else
    false
  end
end
def defeat_monster?
  if roll_dice(2, 6) >= 2
    true
  else
    false
  end
end
def has_treasure?
  if roll_dice(2, 6) >= 1
    true
  else
    false
  end
end

### VAriables

number_of_rooms_explored = 1 
treasure_count = 0 
damage_points = 5
escaped = false
monster = false
current_room = create_room

# Introduction

  puts "You are trapped in a dungeon. See if you can find treasure before you escape!"
  puts "Watch out for monsters! They will find you..."
  puts "To play type one of the given commands."

# Game Loop

while damage_points > 0 and not escaped do
  # Game Code

actions = ["m - move", "s - search"]

puts "Room # #{number_of_rooms_explored}"

puts current_room

# Monster Encounter 
if monster
  puts "Ah! Real Monsters! A monster is approaching!"
  actions << "f-fight"
end

print "What do you do? (#{actions.join(',')}) : "

# Monster Attacks
   player_action = gets.chomp
      if monster and monster_attack?
    damage_points = damage_points - 1
    puts "Ouch! you got hit"
  end  
# Player Commands
  if player_action == "m"
          current_room = create_room
          number_of_rooms_explored =
              number_of_rooms_explored + 1
          monster = has_monster?
          escaped = has_escaped?
  elsif player_action == "s"
      if has_treasure?
              puts "WOW THATS SUPER COOL YOU FOUND #{treasure}!"
              treasure_count = treasure_count + 1
      else
          puts "You searched, but you found NOTHING!"
      end
          #Rigged Condition - searching triggers monsters

      if not monster
              monster = has_monster?
      end
    elsif player_action == "f"
      if defeat_monster?
        monster = false
        puts "you defeated the monster!"
      else
        puts "you missed..."
      end
    else
      puts "Please follow directions, please try at least a little harder please..."
    end
    puts ""

  
end

if damage_points > 0
    puts "Good job, you made it!"
    puts "You explored #{number_of_rooms_explored} rooms"
    puts "and found #{treasure_count} treasures."
  else
    puts "oh no! you didnt make it!"
    puts "you explored #{number_of_rooms_explored} rooms, before YOUR DOOM."
    puts "You trid so hard, and got so far..."
    puts "But in the end, it doesn't even matter..."
end














