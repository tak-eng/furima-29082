class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :direct_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderAddress.new
  end
  
  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:price, :token, :shipping_address_id, :post_code, :city, :house_number, :building_name, :phone_number, :order_id, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency:'jpy'                
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def direct_to_index
    if request.referrer == nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
