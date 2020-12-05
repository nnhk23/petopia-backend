class PetsController < ApplicationController

    def index
        pets = Pet.all
        render json: pets, only: [:id, :name, :breed, :species, :age, :kid_friendly, :personality, :img_url, :description], include: {:appointments => {only: [:start_date, :end_date, :user_id]}}
    end

    def show
        pet = Pet.find_by(id: params[:id])
        render json: pet, only: [:id, :name, :breed, :species, :age, :kid_friendly, :personality, :img_url, :description], include: {:appointments => {only: [:start_date, :end_date, :user_id]}, :users => {only: [:name, :zip_code]}}
    end

end
