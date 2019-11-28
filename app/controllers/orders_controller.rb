class OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    @order.save

    redirect_to dashboard(current_user)
  end

  private

  def order_params
    params.require(:order).permit(:current_user, :seedpack)
  end

end
