class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private
  def order_params 
    params.require(:order_address).permit(:postal_code, :prefecture_id, :local, :house_num, :building_name, :tel_num,).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
