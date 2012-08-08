class Account < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :user
  has_many :entries

  validates :name, :presence => true

  class << self
    def accounts_receivable
      Asset.find_or_create_by_name_and_core('accounts receivable', true)
    end

    def accounts_payable
      Liability.find_or_create_by_name_and_core('accounts payable', true)
    end

    def sales
      Income.find_or_create_by_name_and_core('sales', true)
    end

    def miscellaneous_expense
      Expense.find_or_create_by_name_and_core('misc expense', true)
    end
  end

  def side
    nil
  end

  def balance(start_date = 10.years.ago, end_date = (Date.today + 1.day))
    self.entries.joins(:ftransaction).where(["ftransactions.state = ?", 'memo']).sum(:amount) || 0
  end
end
