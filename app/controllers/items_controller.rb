class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
 
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
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

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :item_condition_id, :shipping_cost_id, :shipping_address_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
