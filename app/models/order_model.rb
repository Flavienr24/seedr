class OrderModel < ApplicationRecord
  belongs_to :user
  belongs_to :seedpack
end
