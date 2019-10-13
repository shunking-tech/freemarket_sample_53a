# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# サイズ一覧
Size.create([{:size=>'サイズなし'},
            {:size=>'XXS以下'}, {:size=>'XS(SS)'}, {:size=>'S'},
            {:size=>'M'}, {:size=>'L'}, {:size=>'XL(LL)'},
            {:size=>'2XL(3L)'}, {:size=>'3XL(4L)'}, {:size=>'4XL(5L)以上'},
            {:size=>'FREE SIZE'},
            ])


# カテゴリー親要素の一覧
lazies = Category.create(:name=>"レディース")
mens = Category.create(:name=>"メンズ")
baby = Category.create(:name=>"ベビー・キッズ")
interior = Category.create(:name=>"インテリア・住まい・小物")
book = Category.create(:name=>"本・音楽・ゲーム")
toy = Category.create(:name=>"おもちゃ・ホビー・グッズ")
cosmetic = Category.create(:name=>"コスメ・香水・美容")
appliances = Category.create(:name=>"家電・スマホ・カメラ")
sports = Category.create(:name=>"スポーツ・レジャー")
handmade = Category.create(:name=>"ハンドメイド")
ticket = Category.create(:name=>"チケット")
car = Category.create(:name=>"自動車・オートバイ")
other = Category.create(:name=>"その他")

# カテゴリー子要素の一覧
# レディースの子要素
lazies_tops = lazies.children.create(:name=>"トップス")
lazies_jacket = lazies.children.create(:name=>"ジャケット/アウター")
lazies_pants = lazies.children.create(:name=>"パンツ")
lazies_skirt = lazies.children.create(:name=>"スカート")
lazies_onepiece = lazies.children.create(:name=>"ワンピース")
lazies_shoes = lazies.children.create(:name=>"靴")
lazies_roomWear = lazies.children.create(:name=>"ルームウェア/パジャマ")
lazies_regWear = lazies.children.create(:name=>"レッグウェア")
lazies_hat = lazies.children.create(:name=>"帽子")
lazies_bag = lazies.children.create(:name=>"バッグ")
lazies_accessory = lazies.children.create(:name=>"アクセサリー")
lazies_hairAccessory = lazies.children.create(:name=>"ヘアアクセサリー")
lazies_smallArticle = lazies.children.create(:name=>"小物")
lazies_watchs = lazies.children.create(:name=>"時計")
lazies_wig = lazies.children.create(:name=>"ウィッグ/エクステ")
lazies_yukata = lazies.children.create(:name=>"浴衣/水着")
lazies_suit = lazies.children.create(:name=>"スーツ/フォーマル/ドレス")
lazies_maternity = lazies.children.create(:name=>"マタニティ")
lazies_other = lazies.children.create(:name=>"その他")
# メンズの子要素
mens_tops = mens.children.create(:name=>"トップス")
mens_jacket = mens.children.create(:name=>"ジャケット/アウター")
mens_pants = mens.children.create(:name=>"パンツ")
mens_shoes = mens.children.create(:name=>"靴")
mens_bag = mens.children.create(:name=>"バッグ")
mens_suit = mens.children.create(:name=>"スーツ")
mens_hat = mens.children.create(:name=>"帽子")
mens_accessory = mens.children.create(:name=>"アクセサリー")
mens_smallArticle = mens.children.create(:name=>"小物")
mens_watchs = mens.children.create(:name=>"時計")
mens_yukata = mens.children.create(:name=>"水着")
mens_regWear = mens.children.create(:name=>"レッグウェア")
mens_regWear = mens.children.create(:name=>"アンダーウェア")
mens_other = mens.children.create(:name=>"その他")
# ベビー・キッズの子要素
baby_girlsClothesU95 = baby.children.create(:name=>"ベビー服(女の子用) ~95cm")
baby_mensClothesU95 = baby.children.create(:name=>"ベビー服(男の子用) ~95cm")
baby_ClothesU95 = baby.children.create(:name=>"ベビー服(男女兼用) ~95cm")
kids_girlsClothesO100 = baby.children.create(:name=>"キッズ服(女の子用) 100cm~")
kids_mensClothesO100 = baby.children.create(:name=>"キッズ服(男の子用) 100cm~")
kids_ClothesO100 = baby.children.create(:name=>"キッズ服(男女兼用) 100cm~")
kids_shoes = baby.children.create(:name=>"キッズ靴")
child_smallArticle = baby.children.create(:name=>"子ども用ファッション小物")
baby_diaper = baby.children.create(:name=>"おむつ/トイレ/バス")
baby_outing = baby.children.create(:name=>"外出/移動用品")
baby_breastFeeding = baby.children.create(:name=>"授乳/食事")
baby_furniture = baby.children.create(:name=>"ベビー家具/寝具/室内用品")
baby_toys = baby.children.create(:name=>"おもちゃ")
baby_event = baby.children.create(:name=>"行事/記念品")
baby_other = baby.children.create(:name=>"その他")
# インテリア・住まい・小物の子要素
interior_kitchen = interior.children.create(:name=>"キッチン/食器")
# 本・音楽・ゲームの子要素
book_books = book.children.create(:name=>"本")
# おもちゃ・ホビー・グッズの子要素
toy_toys = toy.children.create(:name=>"おもちゃ")
# コスメ・香水・美容の子要素
cosmetic_baseMakeup = cosmetic.children.create(:name=>"ベースメイク")
# 家電・スマホ・カメラの子要素
appliances_smartPhone = appliances.children.create(:name=>"スマートフォン/携帯電話")
# スポーツ・レジャーの子要素
sports_golf = sports.children.create(:name=>"ゴルフ")
# ハンドメイドの子要素
handmade_girlsAccessory = handmade.children.create(:name=>"アクセサリー(女性用)")
# チケットの子要素
ticket_music = ticket.children.create(:name=>"音楽")
# 自動車・オートバイの子要素
car_body = car.children.create(:name=>"自転車本体")
# その他の子要素
other_petSupplies = other.children.create(:name=>"ペット用品")

# カテゴリー孫要素の一覧
# レディースの孫要素
lazies_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"}, {:name=>"シャツ/ブラウス(半袖/袖なし)"}, {:name=>"シャツ/ブラウス(七分/長袖)"}, {:name=>"ポロシャツ"}])
lazies_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"デニムジャケット"}, {:name=>"レザージャケット"}, {:name=>"ダウンジャケット"}])
# メンズの孫要素
mens_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"}, {:name=>"シャツ/ブラウス(半袖/袖なし)"}, {:name=>"シャツ/ブラウス(七分/長袖)"}, {:name=>"ポロシャツ"}])
mens_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"デニムジャケット"}, {:name=>"レザージャケット"}, {:name=>"ダウンジャケット"}])
# ベビー・キッズの孫要素
baby_girlsClothesU95.children.create([{:name=>"トップス"}, {:name=>"アウター"}, {:name=>"パンツ"}, {:name=>"スカート"}, {:name=>"ワンピース"}])
baby_mensClothesU95.children.create([{:name=>"トップス"}, {:name=>"アウター"}, {:name=>"パンツ"}, {:name=>"おくるみ"}, {:name=>"下着/肌着"}])
# インテリア・住まい・小物の孫要素
interior_kitchen.children.create([{:name=>"キッチン/食器"}, {:name=>"ベッド/マットレス"}, {:name=>"椅子/チェア"}, {:name=>"机/テーブル"}, {:name=>"収納家具"}])
# 本・音楽・ゲームの孫要素
book_books.children.create([{:name=>"文学/小説"}, {:name=>"人文/社会"}, {:name=>"ノンフィクション/教養"}, {:name=>"地図/旅行ガイド"}, {:name=>"ビジネス/経済"}])
# おもちゃ・ホビー・グッズの孫要素
toy_toys.children.create([{:name=>"キャラクターグッズ"}, {:name=>"ぬいぐるみ"}, {:name=>"小物/アクセサリー"}, {:name=>"模型/プラモデル"}, {:name=>"ミニカー"}])
# コスメ・香水・美容の孫要素
cosmetic_baseMakeup.children.create([{:name=>"ファンデーション"}, {:name=>"化粧下地"}, {:name=>"コントロールカラー"}, {:name=>"BBクリーム"}, {:name=>"CCクリーム"}])
# 家電・スマホ・カメラの孫要素
appliances_smartPhone.children.create([{:name=>"スマートフォン本体"}, {:name=>"バッテリー/充電器"}, {:name=>"携帯電話本体"}, {:name=>"PHS本体"}, {:name=>"その他"}])
# スポーツ・レジャーの孫要素
sports_golf.children.create([{:name=>"クラブ"}, {:name=>"ウェア(男性用)"}, {:name=>"ウェア(女性用)"}, {:name=>"バッグ"}, {:name=>"その他"}])
# ハンドメイドの孫要素
handmade_girlsAccessory.children.create([{:name=>"アクセサリー(女性用)"}, {:name=>"ファッション/小物"}, {:name=>"アクセサリー/時計"}, {:name=>"日用品/インテリア"}, {:name=>"趣味/おもちゃ"}])
# チケットの孫要素
ticket_music.children.create([{:name=>"男性アイドル"}, {:name=>"女性アイドル"}, {:name=>"韓流"}, {:name=>"国内アーティスト"}, {:name=>"海外アーティスト"}])
# 自動車・オートバイの孫要素
car_body.children.create([{:name=>"国内自動車本体"}, {:name=>"外国自動車本体"}])
# その他の孫要素
other_petSupplies.children.create([{:name=>"ペットフード"}, {:name=>"犬用品"}, {:name=>"猫用品"}, {:name=>"魚用品/水草"}, {:name=>"小動物用品"}])


# サンプル商品データの投入(ユーザー登録完了後に実行してください)
1.upto(5) do |n|
  Item.create!(
    name: "サンプル#{n}",
    price: "#{n}000".to_i,
    description: "テスト#{n}",
    condition: 0,
    task: 0,
    payer_delivery_expense: 0,
    shipping_method: 0,
    delivery_days: 0,
    user_id: 1,
    category_id: "#{n}".to_i,
    size_id: "#{n}".to_i,
    prefecture_id: "#{n}".to_i,
  )
  ItemImage.create!(
    image: open("#{Rails.root}/db/fixtures/sample_image.jpg"), # 画像のファイル(.jpg)は用意したファイル名に修正してください
    item_id: "#{n}".to_i,
  )
end
