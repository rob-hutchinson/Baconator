require 'pry'

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
		if roll_die == 1
			puts "Sorry! You rolled a 1 and scored 0 points this turn."
			return 0
		end
		roll -= 1
	end

	dice_holder.each do |x|
		turn_total +=x
	end

	puts "Your score for this turn was #{turn_total}."	
	turn_total
end

# Loops the code through to the bottom to check if they want to play again
loop do

	player1_total = 0
	player2_total = 0

# puts " ____________________________________________________\n
# |  Welcome to Dice Hog! The goal is to be the first  |\n
# |  player to score 100 points. You can choose how    |\n
# |  many 6-sided dice you would like to roll, but be  |\n
# |  careful. If any of the dice you roll are 1s, you  |\n
# |  score 0 points and it is the next player's turn.  |\n
# |                     Good luck!                     |\n 
# |____________________________________________________|\n"
# puts

	puts "Player one, what's your name?"
	player1_name = gets.chomp
	puts
	puts "And Player two, what's your name?"
	player2_name = gets.chomp
	puts
	

# Loop handles scoring and resets/ends the game
	while player1_total < 20 && player2_total < 20
		puts "#{player1_name}, you currently have #{player1_total} points."
		player1_total += turn
		puts "You now have #{player1_total} points."
		sleep (1.5)
		puts 
		puts "_____________________________________________________" 
		puts 
		puts

		puts "#{player2_name}, you currently have #{player2_total} points."
		player2_total += turn
		puts "You now have #{player2_total} points."
		sleep (1.5)
		puts 
		puts "_____________________________________________________" 
		puts 
		puts
	end

	if player1_total > player2_total
		puts "Congrats #{player1_name}, you win!"
	else
		puts "Congrats #{player2_name}, you win!"
	end
	
	puts
	puts
	puts "Would you like to play again?(y/n)"
	again = gets.chomp
	break if again != "y"
end