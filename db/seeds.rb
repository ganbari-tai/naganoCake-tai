# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(
  email: "admin@admin",
  password: "admin1"
)

[
  'ケーキ',
  'プリン',
  'キャンディ',
  '焼き菓子',
  '穀物',
  '人物'
].each do |genre|
  Genre.create!(
    { name: genre }
  )
end

Customer.create!(
    last_name: "芥川",
    first_name: "龍之介",
    last_name_kana: "あくたがわ",
    first_name_kana: "りゅうのすけ",
    postal_code: "1112222",
    address: "東京市京橋区入船町8丁目",
    phone_number: "08045839284",
    email: "rashoumon@gmail.com",
    password: "akutagawa123",  # パスワードを追加
    password_confirmation: "akutagawa123",  # パスワードの確認入力を追加
    is_active: true
  )

[
  ['customer_id', '3334444', '青森県北津軽郡金木村', '太宰治'],
  ['customer_id', '3334544', '東京府東京市四谷区四谷箪笥町59番地', '中島敦']
].each do |customer_id, cord, add, name|
  Address.create!(
    customer_id: Customer.find_by(email: "rashoumon@gmail.com").id,  # CustomerのIDを指定
    postal_code: cord,
    address: add,
    name: name
  )
end

Item.create!(
  [
    {
      name: "いちごのケーキ",
      introduction: %Q{"いちごをたっぷり使ったケーキ\nイチゴと生クリームのザ・王道"},
      price: 2800,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake1.jpg')),
        filename: 'cake1.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "フルーツプリン",
      introduction: %Q{"さっぱりとした味わい\n季節のフルーツを贅沢に使用しました"},
      price: 3400,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake2.jpg')),
        filename: 'cake2.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "マカロン",
      introduction: %Q{"女性に人気\nカラフルなころんとしたフォルムに心奪われます"},
      price: 800,
      genre_id: 4,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake3.jpg')),
        filename: 'cake3.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "オレンジクリームスプラッシュ",
      introduction: %Q{"爽やかなオレンジの風味と\nクリーミーなテクスチャーが特徴のケーキです"},
      price: 2900,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake4.jpg')),
        filename: 'cake4.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "レッドベルベットフュージョン",
      introduction: %Q{"洗練された味わいと魅力的な外観が特徴のケーキです"},
      price: 3000,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake5.jpg')),
        filename: 'cake5.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "抹茶の幸福",
      introduction: %Q{"抹茶の香りに包まれた贅沢なケーキです"},
      price: 3000,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake6.jpg')),
        filename: 'cake6.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    },
    {
      name: "いちごの桃源郷",
      introduction: %Q{"贅沢ないちごの風味と桃源郷の幸福感を味わえる特別なケーキ"},
      price: 3000,
      genre_id: 1,
      is_active: true,
      image: ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join('app/assets/images/cake7.jpg')),
        filename: 'cake7.jpg',
        content_type: 'image/jpeg'
      ).signed_id
    }
  ]
)
