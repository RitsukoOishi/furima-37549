class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @furima = Furima.find(params[:furima_id])
    @record_delivery = RecordDelivery.new
  end

  #def new
    #@record_delivery = RecordDelivery.new
  #end
  def create
    @furima = Furima.find(params[:furima_id])
    @record_delivery = RecordDelivery.new(record_params)
    if @record_delivery.valid?
      @record_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.permit().merge(user_id: current_user.id, furima_id: params[:furima_id])
    params.require(:record_delivery).permit(:post_code, :prefecture_id, :city, :house, :building_number, :phone).merge(user_id: current_user.id, furima_id: params[:furima_id])
  end
end
