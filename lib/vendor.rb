require "./lib/item"

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      @inventory[item] = 0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    check_stock(item)
    @inventory[item] += amount
  end

  def potential_revenue
    @inventory.sum do |item|
      item.first.price.gsub("$", "").to_f * item.last
    end
  end
end
