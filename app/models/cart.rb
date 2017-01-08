class Cart < ActiveRecord::Base
  has_many :items, through: :line_items 
  has_many :line_items
  belongs_to :user

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity 
    end 
      total 
  end 

  def add_item(item_id)
    if self.items.where(id: item_id).count >= 1
      line_item = LineItem.find_by(cart_id: self.id, item_id: item_id)
      line_item.update(quantity: line_item.quantity + 1)
      return line_item
    else
     line_item = LineItem.new(cart_id: self.id, item_id: item_id, quantity: 1)
    end 
    line_item
  end 

end
