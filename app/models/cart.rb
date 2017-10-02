class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user


   def total
     @cart = Cart.find_by(id: :user_id)
   end

end
