class Item < ApplicationRecord
  
  def add_tax_price
    (self.price * 1.08).round
  end
  
  def get_image
    if image.attached?
      image
    else
      'cake.tuu.jpg'
    end
  end
  
  has_many :order_details
  has_many :cart_items, dependent: :destroy
  has_one_attached :image
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
end
