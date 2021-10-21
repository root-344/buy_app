class StoresController < ApplicationController
  def show
    store = Store.find(params[:id])
    @nickname = store.nickname
    @orders = store.orders
  end
end
