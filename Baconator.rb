# Function to set up the game
def power_up player_name, player_scores
  puts "\n\nWelcome to Baconator! Please help me set up your game.\n"
  puts "How many players do you have?"
  player_num = gets.chomp.to_i
  
  while player_num > 0
    puts "\nPlease enter a player name:\n"
    name = gets.chomp.downcase.capitalize
    player_name.push name
    player_scores.push 0 
    player_num -= 1
  end
end 

# Function to ask for dice number in hog
def dice_num
  dice = 0
  
  while dice == 0
    puts "How many dice would you like to roll?"
    dice = gets.to_i
  end
  dice
end

# Function to roll a die
def roll_die
  die_roll = rand(1..6)
  #
end

# Function to handle a turn of Hog
def hog_turn
  roll = dice_num
  turn_total = 0
  dice_holder = []
  
  while roll > 0
    dice_holder.push roll_die
    roll -= 1
  end
  
  if dice_holder.include?(1)
    puts "Sorry! You rolled a 1 and scored 0 points this turn."
    return 0
  else
    dice_holder.each do |x|
      turn_total +=x
    end
  end

  puts "You rolled #{dice_holder} and your score for this turn was #{turn_total}."  
  turn_total
end

# Function to handle a turn of Pig
def pig_turn
  turn_total = 0

  loop do
    roll = roll_die
    puts "You rolled a #{roll}."
    if roll == 1
      puts "Sorry! You rolled a 1."
      return 0
    else
      turn_total += roll
      puts "Roll again (turn total so far #{turn_total})? (y/n)"
      if gets.chomp == "n"
        return turn_total
      end
    end
  end
end

# Function to check if there is a winner after each turn
def check_winner player_scores
  game_over = false
  (0...player_scores.length).each do |x|
    if player_scores[x] >= 10
      return true
    end
  end
  game_over
end

player_name = []
player_scores = []
  
power_up(player_name, player_scores)

loop do
  puts "\nGreat! Now, which pig-related dice game would you like to play? (Pig/Hog)"
  input = gets.chomp.downcase

# The actual game Mechanics
  if input == "hog"
    puts %{ ____________________________________________________
| Welcome to Dice Hog! The goal is to be the first   |
| player to score 100 points. You can choose how     |
| many 6-sided dice you would like to roll, but be   |
| careful. If any of the dice you roll are 1s, you   |
| score 0 points and it is the next player's turn.   |
| Good luck!                                         |
|____________________________________________________|\n\n}
    sleep(1)
    loop do  
      (0...player_scores.length).each do |x|
        puts "\n#{player_name[x]}, you currently have #{player_scores[x]} points."
        player_scores[x] += hog_turn
        puts "You now have #{player_scores[x]} points."
        sleep (1)
        puts "\n_____________________________________________________\n\n" 
      end
      if check_winner(player_scores) == true
        break
      end
    end
  elsif input == "pig"
      puts %{ ____________________________________________________
| Welcome to Dice Pig! The goal is to be the first   |
| player to score 100 points. On your turn you roll  |
| 6-sided die. Your score is equal to your roll      |
| unless you roll a 1 (which ends your turn). You can|
| choose to roll again as many times as you would    |
| like to, adding to your score, but if you ever roll|
| a 1 your turn is over and you score 0 points for   |
| the turn. Good luck!                               |
|____________________________________________________|\n\n}
      sleep(1)
      loop do  
      (0...player_scores.length).each do |x|
        puts "\n#{player_name[x]}, you currently have #{player_scores[x]} points."
        player_scores[x] += pig_turn
        puts "You now have #{player_scores[x]} points."
        sleep (1)
        puts "\n_____________________________________________________\n\n" 
      end
      if check_winner(player_scores) == true
        break
      end
    end
  end

  puts %{--------------------------------------\n
            GAME OVER!!!\n
--------------------------------------\n}
  puts "\n\nFinal Scoreboard:\n"
  (0...player_scores.length).each do |x|
    puts "#{player_name[x]}: #{player_scores[x]}"
  end

  puts "\n\nWould you like to play again? Typing 'reset' will let you
  change player info. Otherwise type 'y' or 'n'."
  continue = gets.chomp.downcase
  if continue == "n"
    exit
  elsif continue == "reset" 
    load 'baconator.rb'
  else
    player_scores.fill(0)
  end
end