class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private

  def order_address_params
    params.require(:order_address).permit(:zip, :region_id, :city, :house_number, :building_number, :phone).merge(store_id: current_store.id, item_id: params[:item_id])    
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
