class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @items = Item.includes(:user)
    @items = Item.page(params[:page]).per(6)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to root_path if @item.destroy
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id,
                                 :states_id, :shipping_fee_id, :region_id, :eta_id, :price, images: []).merge(farm_id: current_farm.id)
  end

  def move_to_index
    redirect_to action: :index unless farm_signed_in?
  end
end
