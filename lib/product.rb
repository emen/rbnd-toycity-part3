class Product

  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options = {})
    @title, @price, @stock = options.values_at(:title, :price, :stock)
    add_to_products
  end

  def in_stock?
    stock && stock > 0
  end

  def decrease_stock
    raise OutOfStockError, "'#{title}' is out of stock" if stock <= 0
    @stock -= 1
  end

  def self.all
    products.clone
  end

  def self.find_by_title(title)
    products.find { |product| product.title == title }
  end

  def self.in_stock
    products.select(&:in_stock?)
  end

  private
  def add_to_products
    if self.class.products.any? { |product| product.title == title }
      raise DuplicateProductError, "'#{title}' already exists."
    end
    self.class.products << self
  end

  private_class_method
  def self.products
    @@products
  end

end
