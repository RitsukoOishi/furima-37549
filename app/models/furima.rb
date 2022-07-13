class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :fee
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :days_num
  validates :image,         presence: true
  validates :title,         presence: true,length: {maximum: 40}
  validates :content,       presence: true,length: {maximum: 1000}
  validates :genre_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_num_id,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,         presence: true,numericality: {only_integer: true,greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }
end
