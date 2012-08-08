class SalesEntry < Entry
  def initialize(attrs = {})
    super(attrs)
    self.account = Account.sales
  end
end
