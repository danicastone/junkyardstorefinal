class Product < ActiveRecord::Base
  has_many :order_items
  has_many :sales
  default_scope { where(active: true) }

  validates_numericality_of :price,
    greater_than: 0.49,
    message: "The smallest transaction amount Stripe allows is 50 cents, so we've limited the cost of one item to be at least 50 cents." 

  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url => "/assets/products/:id/:style/:basename.:extension", 
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
