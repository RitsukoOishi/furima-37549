class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @furima = Furima.find(params[:furima_id])
  end

  def new
  end
  def create
    @record = Record.create(record_params)
    Delivery.create(delivery_params)
    redirect_to root_path
  end

  private

  def record_params
    params.permit().merge(user_id: current_user.id, furima_id: params[:furima_id])
  end

  def delivery_params
    params.permit(:post_code, :prefecture_id, :city, :house, :building_number, :phone).merge(record_id: @record.id)
  end
end
