class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.price * quantity
  end
  
  def plus_quantity
    product.quantity+=1
  end
  
end
