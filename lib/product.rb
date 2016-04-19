class Product

  @@products = []

  def initialize(options = {})
    @@products << self
  end

  def self.all
    @@products.clone
  end

end
