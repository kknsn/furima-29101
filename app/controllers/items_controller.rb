class ItemsController < ApplicationController

  def index
    @items =Item.order("created_at DESC")
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:state_id,:area_id,:delivery_fee_id,:day_id,:price,:image)
  end
end
