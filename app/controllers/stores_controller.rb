class StoresController < ApplicationController
  before_action :move_to_login
  before_action :set_item
  def show
    store = Store.find(params[:id])
    @nickname = store.nickname
    @orders = store.orders
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_login
    unless store_signed_in?
      redirect_to store_session_path 
    end
  end  
end
