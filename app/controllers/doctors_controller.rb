class DoctorsController < ApplicationController
  before_action :authenticate_request
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find_by_id(params[:id])
    render json: @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find_by_id(params[:id])
    @doctor.destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :speciality, :description, :city, :image)
  end
end
