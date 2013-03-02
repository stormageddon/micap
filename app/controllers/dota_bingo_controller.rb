class DotaBingoController < ApplicationController

  def index
	@game = Game.create
	@board = @game.generate_board(@game.read_options("options.txt"))
	puts "Board: #{@game.get_board().get_board_as_string()}"
	#render :json => "Game: #{@game} Board: #{@game.get_board()}"
	@board
  end
  
  def toggle
	render :text => "/Toggle"
  end
  
  def update
	render :text => "/update"
  end
end






