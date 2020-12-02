class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, only: [:id, :name, :zip_code], include: {:appointments => {only: [:start_date, :end_date, :pet_id]}}
    end

    def show
        user = User.find_by(id: params[:id])
        pet = Pet.find_by(id: params[:pet_id])
        render json: user, only: [:id, :name, :zip_code], include: {:appointments => {only: [:start_date, :end_date, :pet_id]}, :pets => {only: [:name, :species, :breed, :age, :kid_friendly, :personality, :img_url, :description]}}
    end

end
