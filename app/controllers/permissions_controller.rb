class PermissionsController < ApplicationController
  before_action :set_permission, only: %i[show edit update destroy]

  def index
    @permissions = Permission.all
  end

  def show; end

  def new
    @permission = Permission.new
  end

  def create
    @permission = Permission.new(permission_params)

    if @permission.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def update
    if @permission.update(permission_params)
      redirect_to permissions_path
    else
      render :edit
    end
  end

  def destroy
    @permission.destroy if @permission.present?

    redirect_to permissions_path
  end

  private

  def set_permission
    @permission = Permission.find(params[:id])
  end

  def permission_params
    params.require(:permission).permit(:name, :role_id)
  end
end
