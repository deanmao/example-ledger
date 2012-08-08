class ReceivableEntry < Entry
  def initialize(attrs = {})
    super(attrs)
    self.account = Account.accounts_receivable
  end
end
