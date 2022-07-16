class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @furimas = Furima.order("created_at DESC")
    #@record = Record.all
  end
  def new
    @furima = Furima.new
  end
  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end
  #def edit
  #end

  private
  def furima_params
    params.require(:furima).permit(:image, :title, :content, :genre_id, :condition_id, :fee_id, :prefecture_id, :days_num_id, :price).merge(user_id: current_user.id)
  end    
end
