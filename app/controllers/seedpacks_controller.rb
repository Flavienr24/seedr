class SeedpacksController < ApplicationController
  before_action :set_seedpack, only: [:show, :edit, :update, :destroy]

  def index
    # @seedpacks = Seedpack.all
    @all_orders = Order.all
    @seedpacks_available = Seedpack.where.not(id: Order.pluck(:seedpack_id))
  end

  def show
  @user = @seedpack.user
  end

  def new
    @seedpack = Seedpack.new
  end

  def edit
  end

  def create
    @seedpack = Seedpack.new(seedpack_params)
    @seedpack.user = current_user
    if @seedpack.save
      redirect_to seedpacks_path(@seedpack), notice: "Seed was successfully created"
    else
      render :new
    end
  end

  def update
    if @seedpack.update(seedpack_params)
      redirect_to @seedpack, notice: "Seed was successfully updated"
    else
      render :edit
    end
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
