class HikesController < ApplicationController

	def index
	end

	def show
		@hike = Hike.find(params[:id])
	end


end	