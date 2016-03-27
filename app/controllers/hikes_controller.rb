class HikesController < ApplicationController

	def index 
		@hikes = Hike.all
	end

	def new 
		@hike = Hike.new
	end

	def create
		@hike = Hike.create(hike_params)
		redirect to hikes_path
	end

	def edit
		@hike = Hike.find(params[:id])
	end

	def update
		@hike = Hike.find(params[:id])
		@hike.update_attributes(hike)
		redirect_to hikes.path
	end

	def show
		@hike = Hike.find(params[:id])
	end

	def destroy
		@hike = Hike.find(params[:id])
		@hike.destroy
		redirect_to hikes_path 
	end

	private

	def hikes_params
		params.require(:hike).permit(:location, :name, :description)
	end

end

