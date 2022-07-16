class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:edit, :show, :update]

  def index
    @furimas = Furima.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @furima.update(furima_params)
      redirect_to furima_path(@furima)
    else
      render :edit
    end
  end

  private
  def furima_params
    params.require(:furima).permit(:image, :title, :content, :genre_id, :condition_id, :fee_id, :prefecture_id, :days_num_id, :price).merge(user_id: current_user.id)
  end
  def set_furima
    @furima = Furima.find(params[:id])
  end
end
