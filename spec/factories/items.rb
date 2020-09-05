FactoryBot.define do
  factory :item do
    name                  {"abe"}
    description           {"説明"}
    price                 {"300"}
    category_id           {2}
    product_status_id     {2}
    shipping_charges_id   {2}
    shipping_region_id    {2}
    shipping_day_id       {2}
    association :user
  end
end