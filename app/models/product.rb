class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :price, presence: true #проверка на заполнение полей
  validates :price, numericality: {greater_than_or_equal_to: 0.01} #проверка на число больше или равно 0.01
  validates :title, uniqueness: true #проверка на уникальность
  validates :image_url, allow_blank: true, format: { 
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'URL should have GIF, JPG or PNG format.'
    #'URL должен указывать на изображение формата GIF, JPG или PNG.' кодировка не та
}

has_many :line_items
      before_destroy :ensure_not_referenced_by_any_line_item
    #...
      private
      # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
      def ensure_not_referenced_by_any_line_item
          if line_items.empty?
              return true
          else
                errors.add(:base, 'Item positions already exist.')
              return false
          end
      end
end
