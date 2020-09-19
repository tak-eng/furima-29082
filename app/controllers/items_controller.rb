class ItemsController < ApplicationController
  before_action :price
 
  def index
  end

  def new
    @item = Item.new
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

  private

  def price
    @item = Item.find(params[:id])
    render json: { post: item }
  end

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :item_condition_id, :shipping_costs_id, :shipping_address_id, :delivery_date_id).merge(user_id: current_user.id)
  end

end
