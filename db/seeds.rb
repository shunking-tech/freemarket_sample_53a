# coding: utf-8

10.times do |index|
  Item.create!(
    name: "名前#{index}",
    price: index,
    description: "商品説明#{index}",
    condition: 0,
    task: 0,
    payer_delivery_expense: 0,
    delivery_days: "配送日数#{index}",
    prefecture: "出荷地域#{index}",
    user_id: 1,
    category: "カテゴリ#{index}",
    size: 1,
  )
end