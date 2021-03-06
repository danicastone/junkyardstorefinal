class CartsController < ApplicationController

  before_action :authenticate_user!

  def show
    cart_ids = $redis.smembers current_user_cart
    @order_items = current_order.order_items
  end

  def add
    $redis.SADD current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end
 
  def remove
    $redis.SREM current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end
 
  private
 
  def current_user_cart
    "cart#{current_user.id}"
  end
end
