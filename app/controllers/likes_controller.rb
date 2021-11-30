class LikesController < ApplicationController
  before_action :move_to_index, only: [:create, :destroy]
  before_action :set_item, only: [:create, :destroy]

  def create
    @like = Like.create(item_id: @item.id, store_id: current_store.id)
  end

  def destroy
    @like = Like.find_by(store_id: current_store.id, item_id: @item.id)
    @like.destroy
  end

  private

  def move_to_index
    redirect_to action: :index unless store_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
