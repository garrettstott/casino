require 'pry'
require_relative 'player'
require_relative 'hi_low_numbers'
require_relative 'hi_low_cards'
require_relative 'hi_low_die'
require_relative 'slots'

class Casino
	attr_accessor :player

	def initialize
		puts "Welcome to the casino!"
		@player = Player.new
		game_menu
	end

	def game_menu
		puts "-- GAMES --"
		puts "1: HiLo with Numbers"
		puts "2: HiLo With Cards"
		puts "3: HiLo With Dice"
		puts "4: Slots"
		puts "5: Wallet"
		puts "6: Exit"
		random_event
	end

	def game_choice
		input = gets.strip.to_i
		case input
		when 1
			HiLoNumbers.new(player)
		when 2
			HiLoCards.new(player)
		when 3
			HiLoDie.new(player)
		when 4
			Slots.new(player)
		when 5
      puts "------------------------------"
      puts "Wallet: $#{player.wallet.amount.to_f}"
      puts "------------------------------"
		when 6
			exit
		else
			puts "Please Enter a valid choice!"
		end
		game_menu
	end

	def random_event
		rand_num = rand(1..20)
		if rand_num == 5
			puts "------------------------------------------------------"
			puts "You fall down the stairs, break your neck, and die :-("
			puts "------------------------------------------------------"
		elsif rand_num == 6
			puts "------------------------------------------------------"
			puts "You find $1000 in your pocket!"
			puts "------------------------------------------------------"
			player.wallet.amount = player.wallet.amount + 1000
			game_choice
		else
			game_choice
		end
	end
end

casino = Casino.new
