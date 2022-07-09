class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end
  def new
    @furima = Furima.new
  end
  def create
    Furima.create(furima_params)
  end

  private
  def furima_params
    params.require(:furima).permit(:image, :title, :content, :genre_id, :condition_id, :fee_id, :prefecture_id, :days_num_id, :price, :user)
  end    
end
