# A board will consist of 25 tiles
#   in a 5x5 pattern. The center tile
#   will be a Free square

class Board < ActiveRecord::Base
	# attr_accessible :title, :body
	belongs_to :game
	has_many :tiles
	
	#@boardTiles
	
	def create()
		@boardTiles = {}
	end
	
	#def initialize()
	#	@boardTiles = {}
	#end
	
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
