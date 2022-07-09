class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image,         presence: true
  validates :title,         presence: true
  validates :content,       presence: true
  validates :condition_id,  presence: true
  validates :fee_id,        presence: true
  validates :prefecture_id, presence: true
  validates :days_num_id,   presence: true
  validates :price,         presence: true
end
