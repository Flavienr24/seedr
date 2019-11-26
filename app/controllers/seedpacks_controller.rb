class SeedpacksController < ApplicationController
  before_action :set_seedpack, only: [:show, :edit, :update, :destroy]

  def index
    @seedpacks = Seedpack.all
  end

  def new
    @seedpack = Seedpack.new
  end

  def create
    if @seedpack = seedpack.create(seedpack_params)
      redirect_to seedpack_path(@seedpack)
    else
      render :new
    end
  end

  def show
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
    params.require(:seedpack).permit(:name, :description, :image, :number, :price, :user_id)
  end

  def set_seedpack
    @seedpack = Seedpack.find(params[:id])
  end
end
