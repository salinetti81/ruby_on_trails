class HikesController < ApplicationController

	def index 
		@hikes = Hike.all
		if params[:search]
    	@hikes = Hike.search(params[:search])
  	else
    	@hikes = Hike.all
  	end
	end

	def create
		@hike = Hike.create(hikes_params)
		redirect_to hikes_path
	end

	def new 
		@hike = Hike.new
		 puts "================="
      puts "New Hike Created"
      puts "================="
	end

	def edit
		@hike = Hike.find(params[:id])
		puts "======================"
    puts "Information was edited"
    puts "======================"
	end

	def show
		@hike = Hike.find(params[:id])
	end

	def update
		@hike = Hike.find(params[:id])
		@hike.update_attributes(hike)
		redirect_to hikes.path
		puts "====================="
    puts "User info was updated"
    puts "====================="
	end

	def destroy
		@hike = Hike.find(params[:id])
		@hike.destroy
		redirect_to hikes_path 
	end

	private

	def hikes_params
		params.require(:hike).permit(:name, :location, :description, :img_url)
	end

end

