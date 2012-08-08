class Ftransaction < ActiveRecord::Base
  attr_accessible :state, :type

  has_many :entries, :dependent => :destroy

  has_one :sales_entry, :class_name => 'SalesEntry'
  has_one :source_entry, :class_name => 'Entry', :conditions => {:source => true}

  validate :check_zero_entries
  validate :check_unbalanced_entries

  state_machine :state, :initial => :memo do
    event :post do
      transition :memo => :posted
    end
  end

  def balanced?
    self.entries.inject(0){|sum,entry| sum + (entry.amount || 0)} == 0
  end

  private
  def check_zero_entries
    self.errors[:base] << "there are no entries" unless self.entries.size > 0
  end

  def check_unbalanced_entries
    self.errors[:base] << "entries are unbalanced" unless balanced?
  end
end
