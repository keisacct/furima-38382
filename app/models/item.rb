class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    belongs_to :category
    belongs_to :quality
    belongs_to :postage
    belongs_to :shipping_day
    belongs_to :prefecture
    has_one_attached :image
    has_one :purchase
    
    validates :image, presence: true
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: {
        only_integer: true, 
        greater_than_or_equal_to: 300, 
        less_than_or_equal_to: 9999999, 
        message: "must be between ¥300~¥9,999,999 or is not a number"
    }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :quality_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
