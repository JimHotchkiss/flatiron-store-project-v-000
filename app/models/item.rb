class Item < ActiveRecord::Base
  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    @available_items = []
    Item.all.each do |available_item|
      if available_item.inventory > 0
        @available_items << available_item
      end
    end
    @available_items
  end


end
