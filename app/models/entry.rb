class Entry < ActiveRecord::Base
  attr_accessible :account_id, :amount, :ftransaction_id, :source, :type

  belongs_to :ftransaction
  belongs_to :account

  def side_amount
    if amount && :credit == account.side
      return -amount
    else
      return amount || 0
    end
  end

  def side_amount=(amt)
    if :credit == account.side
      self.amount = -amt
    else
      self.amount = amt
    end
  end
end
