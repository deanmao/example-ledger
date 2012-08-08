require 'spec_helper'

describe Ftransaction do
  it "should require entries before saving" do
    txn = build(:ftransaction)
    txn.should_not be_valid
    txn.entries << build(:asset_entry, :amount => 1)
    txn.entries << build(:expense_entry, :amount => -1)
    txn.valid?
    txn.should be_valid
  end

  it "should prevent unbalanced entries" do
    txn = build(:ftransaction)
    txn.entries << build(:asset_entry, :amount => 1)
    txn.should_not be_valid
    txn.entries << build(:expense_entry, :amount => -1)
    txn.should be_valid
  end
end
