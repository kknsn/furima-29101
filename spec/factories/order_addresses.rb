FactoryBot.define do
  factory :order_address do
    user_id            {1}
    item_id            {1}
    postal_code        {"123-4567"}
    prefecture_id      {2}
    local              {"横浜市緑区"}
    house_num          {"青山1-1-1"}
    building_name      {"ビル303"}
    tel_num            {"09012345678"}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end
