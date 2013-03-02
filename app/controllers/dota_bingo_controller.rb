class DotaBingoController < ApplicationController
  @game
  @board
  def index
	@game = Game.new
	#@board = game.get_board().get_board_as_string()
	@board = @game.get_board()
	@board
  end
  
  def toggle
	puts "Toggling"
	#@board = game.get_board()
	@board = @game.get_board()
	puts "Board: #{@board.get_board_as_string()}"
	#@board.get_tile_at_coord([params["x_val"],params["y_val"]]).toggleActivate()
	render :action => "index"
  end
  
  def update
	@board = @game.get_board()
	@board
  end
end
class Tile
	@tileCoord = []
	@tileValue = ""
	@isActivated = false
	@a_fucking_id = 0
	
	def initialize(coords,value, id)
		@tileCoord = coords
		arrayValue = format_value(value)
		@tileValue = arrayValue.join("\n")
		@a_fucking_id = id
	end
	
	def toggleActivated()
		@isActivated = !@isActivated
	end
	
	def get_is_activated()
		@isActivated
	end
	
	def get_tile_value()
		@tileValue
	end
	
	def get_tile_coords()
		@tileCoord
	end
	
	def get_tile_id()
		@a_fucking_id
	end
	
	def format_value(text)
		return text.scan(/.{1,30}/)
	end
end

# A board will consist of 25 tiles
#   in a 5x5 pattern. The center tile
#   will be a Free square
class Board
	@boardTiles
	
	def initialize()
		@boardTiles = {}
	end
	
	def create_and_add_new_tile(tileCoord, tileValue, id)
		#@boardTiles[id] = Tile.new(tileCoord, tileValue, id)
		@boardTiles[tileCoord] = Tile.new(tileCoord, tileValue, id)
		#@boardTiles[tileCoord] = tileValue
	end
	
	def add_tile(coords, tile, id)
		@boardTiles[tile.get_tile_coords()] = tile
		#@boardTiles[id] = Tile.new(coords, tile.get_tile_value, id)
	end
	
	def get_tile_at_coord(id)
		#puts "Fetched: #{@boardTiles.fetch(id).get_tile_value()}"
		puts "Fetched: #{@boardTiles.fetch(id)}"
		@boardTiles.fetch(id)
	end
	
	def print_tile_at_coord(coord)
		puts @boardTiles.fetch(coord).get_tile_value()
	end
	
	def print_board()
		id = 0
		for x in 0..4
			currRow = "| "
			for y in 0..4
				currRow += " #{@boardTiles.fetch([x,y]).get_tile_value()} |"
				id += 1
			end
			puts "#{currRow.to_s} \n\n"
		end
	end
	
	def get_board_as_string()
		stringified_board = ""
		id = 0
		for x in 0..4
			currRow = "| "
			for y in 0..4
				#currRow += " #{@boardTiles.fetch([x,y]).get_tile_value()} |"
				currRow += " #{@boardTiles.fetch([x,y])} |"
				id += 1
			end
			stringified_board += "#{currRow} \n\n"
		end
		stringified_board
	end
			
	
	def size()
		@boardTiles.size()
	end
	
end

class Game
	@board = Board.new
	
	def initialize()
		@board = Board.new
		path = "options.txt"
		options = read_options(path)
		@board = generate_board(options)
		puts "Printing board: #{@board.get_board_as_string()}"
	end
	
	def read_options(fileName)
		optionsArray = []
		File.read(File.expand_path("../options.txt",__FILE__)).each_line do |line|
			#optionsArray.push(line.chomp.center(70))
			optionsArray.push(line)
			
		end
		
		return optionsArray	
	end
	
	def generate_board(tileData) 
		x = 0
		y = 0
		r = Random.new
		id = 0
		puts "Board: #{@board}"
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

