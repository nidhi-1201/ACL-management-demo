class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hotel, only: %i[show edit update destroy]

  def index
    @clients = Client.all
  end

  def show; end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to @clients_path
    else
      render :edit
    end
  end

  def destroy
    @client.destroy if @client.present?

    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find_by(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :phno)
  end
end
