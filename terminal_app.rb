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


### VAriables

number_of_rooms_explored = 1 
treasure_count = 0 
damage_points = 5
escaped = false
monster = false
current_room = ""

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

  
end

if damage_points > 0
    puts "Good job, you made it!"
    puts "You explored #{number_of_rooms_explored} rooms"
    puts "and found #{treasure_count} treasures."
  else
    puts "oh no! you didnt make it!"
    puts "you explored #{number_of_rooms_explored} rooms, before YOUR DOOM."
end














