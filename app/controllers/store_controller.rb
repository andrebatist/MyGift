class StoreController < ApplicationController
  def index
    @products=Product.order(:title) #заносим в представление модели Store данные по модели Product в алфавитном порядке по столбцу title 
    @time = Time.now  #время сейчас
  end
end
