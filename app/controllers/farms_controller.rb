class FarmsController < ApplicationController
  def show
    farm = Farm.find(params[:id])
    @nickname = farm.nickname
    @email = farm.email
    @items = farm.items
    @image = farm.image
    @item = Item.find_by(params[:farm_id])
  end
end
