class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user

   def add_item(item_id)
     items_in_cart = self.line_items.find_by(item_id: item_id)
     if items_in_cart
       items_in_cart.quantity += 1
       items_in_cart.save
     else
       items_in_cart = line_items.build(item_id: item_id)
     end
     items_in_cart
   end


   def total
     total = 0
     self.line_items.each do |line_item|
       total += line_item.item.price * line_item.quantity
     end
     total
   end

   def checkout
     self.status = 'submitted'
     update_inventory
   end

   def update_inventory
     if self.status == 'submitted'
       self.line_items.each do |line_item|
         line_item.item.inventory -= line_item.quantity
         line_item.item.save
       end
     end
   end

   def clear_cart
     self.line_items = []
   end









end
