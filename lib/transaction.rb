class Transaction

  attr_reader :customer, :product

  @@id           = 0
  @@transactions = []

  def initialize(customer, product)
    @customer, @product = customer, product
    product.decrease_stock
    incr_id
    add_to_transactions
  end

  def id
    @@id
  end

  def self.all
    transactions.clone
  end

  def self.find(id)
    transactions[id-1]
  end

  private
  def incr_id
    @@id += 1
  end

  def add_to_transactions
    self.class.transactions << self
  end

  private_class_method
  def self.transactions
    @@transactions
  end

end
