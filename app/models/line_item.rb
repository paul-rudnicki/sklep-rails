class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def full_name
    unit_price * quantity
  end
end
