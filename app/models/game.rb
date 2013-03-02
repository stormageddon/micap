class Game < ActiveRecord::Base
	# attr_accessible :title, :body
	has_one :board
	
	def create()
		@board = Board.create
	end
	
	#def initialize()
		#@board = Board.new
		#path = "options.txt"
		#options = read_options(path)
		#@board = generate_board(options)
		#puts "Printing board: #{@board.get_board_as_string()}"
	#	puts "Initializing Game"
	#end
	
	def read_options(fileName)
		optionsArray = []
		#File.read(File.expand_path("../options.txt",__FILE__)).each_line do |line|
		File.read(Rails.public_path + "/options.txt").each_line do |line|
			#optionsArray.push(line.chomp.center(70))
			optionsArray.push(line)
			
		end
		
		return optionsArray	
	end
	
	def generate_board(tileData) 
		#@board = Board.create
		x = 0
		y = 0
		r = Random.new
		id = 0
		for i in 0..24 do
			index = r.rand(tileData.length)
			#tile = Tile.new([x,y],tileData[index])
			
			#@board.add_tile([x,y],tile)
			@board.create_and_add_new_tile([x,y],tileData[index], id)
			tileData.delete_at(index)
			y += 1
			id += 1
			if y == 5
				y = 0
				x += 1
			end
			if x == 5
				return @board
			end
		end
		return @board
	end
	
	def get_board()
		return @board
	end
	
	def get_board_as_string()
		return @board.get_board_as_string()
	end
end
