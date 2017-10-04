class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    @user = User.find_by(id: current_user)
  end

end
