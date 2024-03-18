class Item < ApplicationRecord
  
  #attachment :image
  has_one_attached :image
  belongs_to :genre

  def add_tax_price
    (self.price * 5).round
  end
  
  def get_image
    if image.attached?
      image
    else
      'cake.tuu.jpg'
    end
  end
  
  

end
