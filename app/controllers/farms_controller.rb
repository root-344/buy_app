class FarmsController < ApplicationController
  def show
    farm = Farm.find(params[:id])
    @nickname = farm.nickname
    @items = farm.items
  end
end
