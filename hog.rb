require 'pry'
=begin
TODO: 
=end	

# Function to ask for dice number
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

# Function to handle a full turn
def turn
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

# Function to set up the game
def power_up player_name, player_scores
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

# Function to check if there is a winner after each turn
def check_winner player_scores, winner
	game_over = false
	(0...player_scores.length).each do |x|
    if player_scores[x] >= 20
      return true
		end
  end
  game_over
  
end

# Loops the code through to the bottom to check if they want to play again
loop do

	player_name = []
	player_scores = []
  winner = []

puts %{ ____________________________________________________
| Welcome to Dice Hog! The goal is to be the first   |
| player to score 100 points. You can choose how     |
| many 6-sided dice you would like to roll, but be   |
| careful. If any of the dice you roll are 1s, you   |
| score 0 points and it is the next player's turn.   |
|                    Good luck!                      |
|____________________________________________________|\n\n}
	
power_up(player_name, player_scores)

		loop do  
			(0...player_scores.length).each do |x|
				puts "\n#{player_name[x]}, you currently have #{player_scores[x]} points."
				player_scores[x] += turn
				puts "You now have #{player_scores[x]} points."
				sleep (1.5)
				puts "\n_____________________________________________________\n\n" 
			end
			if check_winner(player_scores,winner) == true
				break
			end
		end

  puts %{GAME OVER}
  puts "\n\nFinal Scoreboard:\n"
  (0...player_scores.length).each do |x|
  	puts "#{player_name[x]}: #{player_scores[x]}"
  end
	
	puts "\n\nWould you like to play again?(y/n)"
	again = gets.chomp
	break if again != "y"
end