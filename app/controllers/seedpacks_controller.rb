class SeedpacksController < ApplicationController
  before_action :set_seedpack, only: [:show, :edit, :update, :destroy]

  def index
    @seedpacks = Seedpack.all
  end

  def new
    @seedpack = Seedpack.new
  end

  def create
    @seedpack = Seedpack.new(seedpack_params)
    @seedpack.user = current_user
    if @seedpack.save
      redirect_to seedpacks_path(@seedpack)
    else
      render :new
    end
  end

  def show
    @user = User.find(@seedpack.user_id)
  end

  def edit
  end

  def update
    @seedpack.update(seedpack_params)
  end

  def destroy
    @seedpack.destroy
  end

  private

  def seedpack_params
    params.require(:seedpack).permit(:name, :description, :image, :number, :price)
  end

  def set_seedpack
    @seedpack = Seedpack.find(params[:id])
  end
end
