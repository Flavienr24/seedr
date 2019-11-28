class OrdersController < ApplicationController

  def create
    @seedpack = Seedpack.find(params[:seedpack_id])
    @order = Order.new
    @order.seedpack = @seedpack
    @order.user = current_user
    @order.save

    redirect_to seedpack_confirmation_path
  end

  def confirmation
  end
end
