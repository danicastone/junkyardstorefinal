class Product < ActiveRecord::Base
  has_many :order_items
  has_many :sales
  default_scope { where(active: true) }

  validates_numericality_of :price,
    greater_than: 49,
    message: "The smallest transaction amount Stripe allows is 50 cents, so we've limited the cost of one item to be at least 50 cents."

end
