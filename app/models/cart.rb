class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy #у одной корзины может быть много товарных позиций
                                            # но товарные позиции без корзины не существуют
end
