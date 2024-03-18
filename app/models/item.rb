class Item < ApplicationRecord
  
  #attachment :image
  has_one_attached :image
  belongs_to :genre
  

end
