module CurrentCart  #модуль для контроллеров для создания временной корзины при пользовательской сессии
  extend ActiveSupport::Concern
  private
    def set_cart 
      @cart = Cart.find(session[:cart_id]) #в параметр cart заносим пользовательскую сессию
      
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create #если значение сессии в параметр почему-то не записалось
                          #создаем объект корзина вручную  
      session[:cart_id] = @cart.id  #в массив сессий заносим  id временной корзины
    end
end