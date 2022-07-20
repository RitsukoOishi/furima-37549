class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @furima = Furima.find(params[:furima_id])
    unless  Record.exists?(furima_id:@furima.id) || current_user.id == @furima.user_id
      @record_delivery = RecordDelivery.new
    else
      redirect_to root_path
    end
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @record_delivery = RecordDelivery.new(record_params)

      if @record_delivery.valid?
        pay_item
        @record_delivery.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def record_params
    params.permit().merge(user_id: current_user.id, furima_id: params[:furima_id])
    params.require(:record_delivery).permit(:post_code, :prefecture_id, :city, :house, :building_number, :phone).merge(user_id: current_user.id, furima_id: params[:furima_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @furima.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

end
