class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end 

  def checkout 
    @cart = Cart.find_by(id: params[:id])
    @cart.line_items.each do |line_item|
      item = line_item.item
      item.inventory -= line_item.quantity
      item.save
    end
    @cart.status = "submitted"
    @cart.save
    @user.update.current_cart = nil
    redirect_to cart_path(@cart)
  end 

end
