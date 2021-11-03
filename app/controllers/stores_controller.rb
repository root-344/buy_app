class StoresController < ApplicationController
  before_action :move_to_login
  def show
    store = Store.find(params[:id])
    @nickname = store.nickname
    @email = store.email
    @orders = store.orders
    @items = store.item_id
  end

  private
  def move_to_login
    redirect_to store_session_path unless store_signed_in?
  end
end
