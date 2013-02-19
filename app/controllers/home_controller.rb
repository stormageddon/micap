class HomeController < ApplicationController
  def index
	logger.debug("CURRENTLY DISPLAYING home/index")
	@currDate = Date.today
  end
end
