class Tile < ActiveRecord::Base
    # attr_accessible :title, :body
	belongs_to :board
	
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
