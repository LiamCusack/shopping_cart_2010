class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def check_vendor_sells_item(vendor, item)
    if vendor.inventory.include?(item) == true
      vendor
    end
  end

  def vendors_that_sell(item)
    @vendors.map do |vendor|
      check_vendor_sells_item(vendor, item)
    end.compact #wanted to use filter_map instead of .compact but I think I have the wrong version
  end

#in progress
  def total_inventory
    total_inv = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        total_inv[item] = {quantity: vendor.check_stock(item), vendors: self.vendors_that_sell(item)}
      end
    end
    total_inv
  end

  def count_vendors_that_sell_item(item)
    vendors_that_sell_item(item).count
  end

  def overstocked_items #wont work until I get total_inventory working
    total_inventory.keys.map do |key|
      if keys[:quantity] > 50 && count_vendors_that_sell_item(key) > 1
        key
      end
    end.compact
  end

  def sorted_item_list
    item_list = []
    @vendors.each do |vendor|

  end
end
