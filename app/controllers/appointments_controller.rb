class AppointmentsController < ApplicationController

    def index
        appointments = Appointment.all
        user = User.find_by(id: params[:user_id])
        pet = User.find_by(id: params[:pet_id])
        render json: appointments, only: [:id, :user_id, :pet_id, :start_date, :end_date], include: {:pet => {only: [:name]}}
    end

    def show
        appointment = Appointment.find_by(id: params[:id])
        user = User.find_by(id: params[:user_id])
        pet = User.find_by(id: params[:pet_id])
        render json: appointment, only: [:id, :user_id, :pet_id, :start_date, :end_date]
    end

    def create
        user = User.find_by(id: params[:user_id])
        pet = User.find_by(id: params[:pet_id])
        appointment = Appointment.create(appointment_params)
        render json: appointment
    end

    def update
        user = User.find_by(id: params[:user_id])
        pet = User.find_by(id: params[:pet_id])
        appointment = Appointment.find_by(id: params[:id])
        appointment.update(appointment_params)
        render json: appointment
    end

    def destroy
        appointment = Appointment.find_by(id: params[:id])
        appointment.destroy
    end

    private

    def appointment_params
        params.require(:appointment).permit(:id, :user_id, :pet_id, :start_date, :end_date)
    end

end
