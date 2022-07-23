class RecordDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house, :building_number, :phone, :user_id, :furima_id, :token
   with_options presence: true do
    validates :user_id
    validates :furima_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house
    validates :phone,format: {with: /\A[0-9]{10,11}\z/}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    record = Record.create(user_id: user_id, furima_id: furima_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house: house, building_number: building_number, phone: phone, record_id: record.id)
  end
end