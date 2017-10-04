class CartsController < ApplicationController


  def show
    cart = Cart.find_by(id: params[:id])
    @user = User.find_by(id: cart[:user_id])
  end
end
