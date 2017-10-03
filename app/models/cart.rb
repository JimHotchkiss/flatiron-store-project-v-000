class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user

   def add_item(item_id)
     already_in_cart = self.line_items.find_by(item_id: item_id)
     if already_in_cart
       already_in_cart.quantity += 1
       already_in_cart
     else
       line_items.build(item_id: item_id)
     end
   end


   def total
     total = 0
     self.line_items.each do |line_item|
       total += line_item.item.price * line_item.quantity
     end
     total
   end

end
