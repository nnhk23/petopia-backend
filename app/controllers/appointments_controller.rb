class AppointmentsController < ApplicationController

    def index
        appointments = Appointment.all
        user = User.find_by(id: params[:user_id])
        pet = User.find_by(id: params[:pet_id])
        render json: appointments, only: [:user_id, :pet_id, :start_date, :end_date]
    end

    # def show
    #     appointment = Appointment.find_by(id: params[:id])
    #     user = User.find_by(id: params[:user_id])
    #     pet = User.find_by(id: params[:pet_id])
    # end

    def create
        user = User.find_by(id: params[:user_id])
        pet = User.find_by(id: params[:pet_id])
        appointment = Appointment.create(appointment_params)
        render json: appointment
    end

    private

    def appointment_params
        params.require(:appointment).permit(:user_id, :pet_id, :start_date, :end_date)
    end

end
