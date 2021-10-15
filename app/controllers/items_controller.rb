class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new    
  end

  def create
    Item.create(item_params)  
    redirect_to root_path 
  end

private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, 
                                 :states_id, :shipping_fee_id, :region_id, :eta_id, :price).merge(farm_id: current_farm.id)
  end

  def move_to_index
    unless farm_signed_in?
      redirect_to action: :index
    end
  end
end
