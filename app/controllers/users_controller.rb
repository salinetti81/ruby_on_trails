class UsersController < ApplicationController
    before_action :authenticate_user!, only: :secure
    def index
      @users = User.all
    end

    def create
    end

    def new
    end

    def edit
    end

    def show
      @user = User.find(params[:id])
    end

    def update
    end

    def destroy
    end

     def secure
      id = current_user.id
      user = User.find(id)

      puts "============"
      p user
      puts "============"
    end

end