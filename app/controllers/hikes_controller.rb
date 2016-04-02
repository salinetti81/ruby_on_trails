class HikesController < ApplicationController

	def index 
		@hikes = Hike.all
		if params[:search]
    	@hikes = Hike.search(params[:search])
  	else
    	@hikes = Hike.all
  end

	def new 
		@hike = Hike.new
		 puts "================="
      puts "New Hike Created"
      puts "================="
	end

	def create
		@hike = Hike.create(hikes_params)
		redirect_to hikes_path
	end

	def edit
		@hike = Hike.find(params[:id])
		puts "======================"
    puts " Hike Information was edited"
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
    puts "Hike info was updated"
    puts "====================="
	end

	def updatejson2
    hike = Hike.find(params[:id])
    puts params[:img_url]
    hike.img_url = params[:img_url]
    hike.save
    render json2: hike
  end

	def destroy
		@hike = Hike.find(params[:id])
		@hike.destroy
		redirect_to hikes_path 
	end
end

private

	def hikes_params
		params.require(:hike).permit(:name, :location, :description, :img_url, :lat, :long)
	end

end

