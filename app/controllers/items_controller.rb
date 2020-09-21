class ItemsController < ApplicationController
  
 
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to controller: :items, action: :index
      else
        render "new"
      end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :item_condition_id, :shipping_cost_id, :shipping_address_id, :delivery_date_id).merge(user_id: current_user.id)
  end

end
