class HotelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hotel, only: %i[show edit update destroy]
  before_action :authorize_action

  def index
    @hotels = Hotel.all
  end

  def show; end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def update
    if @hotel.update(hotel_params)
      redirect_to hotels_path
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy if @hotel.present?

    redirect_to hotels_path
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :phno)
  end

  def authorize_action
    role = current_user.roles.first.permissions
    redirect_to request.referer || root_path, notice: 'Unauthorized Access.' unless role.pluck(:name).include?(action_name)
  end
end
