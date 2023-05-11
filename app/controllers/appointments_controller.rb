class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find_by_id(params[:user_id])
    @appointments = @user.appointments.all
    render json: @appointments
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

  def new
    @appointment = Appointment.new
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
