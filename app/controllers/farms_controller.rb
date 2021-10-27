class FarmsController < ApplicationController
  def show
    farm = Farm.find(params[:id])
    @nickname = farm.nickname
    @email = farm.email
    @items = farm.items
  end
end
