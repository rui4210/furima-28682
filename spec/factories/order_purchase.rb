FactoryBot.define do
  factory :order_purchase do
    post_number           {"000-0000"}
    prefecture            {2}
    city                  {"大阪市"}
    address               {"１−１−１"}
    phone_number          {"00000000000"}
    #association :item_purchase
  end
end
