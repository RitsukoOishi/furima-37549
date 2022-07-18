class Record < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one    :delivery


end
