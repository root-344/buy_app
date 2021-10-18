class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private

  def order_address_params
    params.require(:order_address).permit(:zip, :region_id, :city, :house_number, :building_number, :phone).merge(store_id: current_store.id, item_id: params[:item_id], token: params[:token])    
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_address_params[:token],
      currency: 'jpy'
    )

  end
end
