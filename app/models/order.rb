class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  # 支払い方法　0:クレジットカード,1:銀行振込
  enum payment_method: { credit_card: 0, transfer: 1 }
  # 注文ステータス　0:入金待ち,1:入金確認,2:製作中,3:発送準備中,4:発送済み
  enum status: { waiting: 0, payment: 1, production:2, preparation:3, delivered:4 }
end
