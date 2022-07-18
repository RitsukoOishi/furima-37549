class RecordDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house, :building_number,\
   :phone, :record_id, :user_id, :furima_id, :price
   
   with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    record = Record.create(user_id: user_id, furima_id: furima_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house: house, building_number: building_number, phone: phone, record_id: record.id)
  end
end