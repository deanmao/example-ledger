require 'spec_helper'

describe Account do
  it "should be able to compute the balance for an account" do
    txn = create(:ftransaction, :entries => [build(:asset_entry), build(:expense_entry)])
    a = txn.entries.first.account
    b = txn.entries.last.account
    if a.side == :debit
      a.balance.should == 123
      b.balance.should == -123
    elsif a.side == :credit
      a.balance.should == -123
      b.balance.should == 123
    else
      raise "should not get here"
    end
  end
end
