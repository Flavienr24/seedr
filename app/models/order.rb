class Order < ApplicationRecord
  belongs_to :user
  belongs_to :seedpack
<<<<<<< HEAD
  # validates :user_id, uniqueness: { scope: seedpack }
=======
  validates :user_id, uniqueness: { scope: :seedpack }
>>>>>>> 9cc2879a566c2b9d5eb1229af9b6ea0d8e43e7b7
end
