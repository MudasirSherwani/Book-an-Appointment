class AppointmentsController < ApplicationController
  before_action :authenticate_request
  def index
    @user = User.find_by_id(params[:user_id])
    @appointments = @user.appointments.all
    render json: @appointments
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @appointment = @user.appointments.find(params[:id])
    render json: @appointment
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @appointment = @user.appointments.new(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @appointment = @user.appointments.find_by_id(params[:id])
    @appointment.destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:disease, :city, :appointment_date, :appointment_time, :doctor_id)
  end
end
