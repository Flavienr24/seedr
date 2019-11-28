class OrdersController < ApplicationController

  def create
    @seedpack = Seedpack.find(params[:seedpack_id])
    @order = Order.new(user: current_user, seedpack: @seedpack)
    @order.save

    redirect_to seedpack_confirmation_path
  end

  def confirmation
  end
end
