class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  # 製作ステータス　0:製作不可,1:製作待ち,2:作製中,3:作製完了
  enum making_status: { impossible_making: 0, waiting_making: 1, making: 2, finish: 3 }

end
