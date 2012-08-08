FactoryGirl.define do
  factory :asset_entry, :class => Entry do
    amount 123
    association :account, :factory => :asset
  end

  factory :expense_entry, :class => Entry do
    amount -123
    association :account, :factory => :expense
  end
end
