# coding: utf-8

Category.create([
    {:name=>'レディース'},
    {:name=>'メンズ'}, 
    {:name=>'家電・スマホ・カメラ'}, 
    {:name=>'おもちゃ・ホビー・グッズ'},
  ])

  Size.create([
      {:size=>'サイズなし'},
      {:size=>'XXS以下'}, 
      {:size=>'XS(SS)'}, 
      {:size=>'S'},
      {:size=>'M'}, 
      {:size=>'L'}, 
      {:size=>'XL(LL)'},
      {:size=>'2XL(3L)'}, 
      {:size=>'3XL(4L)'}, 
      {:size=>'4XL(5L)以上'},
      {:size=>'FREE SIZE'},
    ])

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
    category_id: 1,
    size_id: 1,
  )
end

# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

