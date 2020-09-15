class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
