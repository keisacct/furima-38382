class PurchaseAddress
    include ActiveModel::Model
    attr_accessor :zipcode, :prefecture_id, :city, :street, :building, :phone_number, :purchase_id, :item_id, :user_id, :token

    with_options presence: true do
        validates :item_id, :user_id, :token, :city, :street
        ZIPCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
        validates :zipcode, format: {
            with: ZIPCODE_REGEX, 
            message: "is invalid. Include hyphen(-)"
        }
        validates :prefecture_id, numericality: { 
            other_than: 1, 
            message: "can't be blank" 
        }
        PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze
        validates :phone_number, format: {
            with: PHONE_NUMBER_REGEX,
            message: "is invalid."
        }
    end
    

    def save
        @purchase = Purchase.create(item_id: item_id, user_id: user_id)
        Address.create(
            zipcode: zipcode, 
            prefecture_id: prefecture_id, 
            city: city, 
            street: street,
            building: building, 
            phone_number: phone_number, 
            purchase_id: @purchase.id
        )
    end
end