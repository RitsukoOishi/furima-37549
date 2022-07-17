class Record < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one    :delivery

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house
    validates :phone
  end
end
