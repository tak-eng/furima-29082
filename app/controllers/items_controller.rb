class ItemsController < ApplicationController
  def index
  end

  def new
  end


  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :item_condition_id, :shipping_costs_id, :shipping_address_id, :derivery_date_id).merge(user_id: current_user.id)
  end

end
