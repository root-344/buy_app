class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_item, except: [:index, :new, :create, :search]
  def index
    @items = Item.includes(:user)
    @items = Item.page(params[:page]).per(6)
  end

  def show
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
  end

  def update
    # 画像複数枚投稿実装の時使用
    # if params[:item][:image_ids]
    #   params[:item][:image_ids].each do |image_id|
    #     image = @item.images.find(image_id)
    #     image.purge
    #   end
    # end
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id,
                                 :states_id, :shipping_fee_id, :region_id, :eta_id, :price, :image).merge(farm_id: current_farm.id)
  end

  def move_to_index
    redirect_to action: :index unless farm_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
