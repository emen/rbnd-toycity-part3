class Product

  attr_reader :title

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products.clone
  end

  private
  def add_to_products
    if products.any? { |product| product.title == title }
      raise DuplicateProductError, "#{title} already exists."
    end
    products << self
  end

  def products
    @@products
  end

end
