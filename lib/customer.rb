class Customer

  attr_reader :name

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    add_to_customers
  end

  def purchase(product)
    Transaction.new(self, product)
  end

  def self.all
    customers.clone
  end

  def self.find_by_name(name)
    customers.find { |customer| customer.name == name }
  end

  private
  def add_to_customers
    if self.class.customers.any? { |customer| customer.name == name }
      raise DuplicateCustomerError, "'#{name}' already exists."
    end
    self.class.customers << self
  end

  private_class_method
  def self.customers
    @@customers
  end

end
