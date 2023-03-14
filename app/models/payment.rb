class Payment < ApplicationRecord
    # アソシエーション
    belongs_to :order
end
