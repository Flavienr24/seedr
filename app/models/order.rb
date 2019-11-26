class Order < ApplicationRecord
  belongs_to :user
  belongs_to :seedpack
  validates :user_id, uniqueness: { scope: seedpack }
end
