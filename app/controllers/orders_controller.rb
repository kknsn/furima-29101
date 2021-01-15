class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params 
    params.require(:order_address).permit(:postal_code, :prefecture_id, :local, :house_num, :building_name, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
