class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy #у одной корзины может быть много товарных позиций
                                            # но товарные позиции без корзины не существуют
=begin
   метод add_product(), который 
будет проверять, имеется ли добавляемый товар в нашем списке позиций, и, если 
такой товар уже есть, будет повышать его количество, а если его не было, будет 
создавать новый объект LineItem
=end
  
  def add_product(product_id)
    current_item=line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity +=1
    else
      current_item=line_items.build(product_id: product_id)
    end
    current_item #return current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
   
end
