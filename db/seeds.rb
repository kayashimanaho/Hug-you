# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.find_by(email:'kayashi0624@test.com').destroy
Admin.create!(
   email: 'kayashi0624@test.com',
   password: 'hogehoge'
)

# User.find_by(email:'kayashima@test.com').destroy
# User.find_by(email:'ashida@test.com').destroy
# User.find_by(email:'akashi@test.com').destroy

users = User.create!(
  [
    {email: 'kayashima@test.com', name: '萱島 菜穂', nick_name: 'かやし', postal_code: '1111111',address: '大分県大分市大在町0-0', age: '25', from: '大分県',introduction: '初めまして！よろしくお願いします', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'ashida@test.com', name: '芦田 愛菜', nick_name: 'まなちゃん', postal_code: '8730555',address: '東京都渋谷区0-0', age: '15', from: '東京都',introduction: '初めまして！いろんな方と繋がりたいです', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'akashi@test.com', name: '明石 ちはる', nick_name: 'ちゃあちゃん', postal_code: '8670233',address: '北海道札幌２−３', age: '32', from: '北海道',introduction: '同じ月齢の方と仲良くしたいです', password: '777777', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

posts = Post.create!(
  [
    {content: '３歳の娘が中々言う事を聞いてくれません。毎日イヤイヤ期です', user_id: users[0].id },
    {content: '下の子が寝返りがまだできないです。もう半年過ぎたのにできなくて大丈夫かなと不安です。成長が遅かった方いますか', user_id: users[0].id },
    {content: '二人育児の方、一人でお風呂はどうしていますか。スムーズなやり方教えて下さい', user_id: users[0].id },
    {content: '野菜が嫌いすぎて何も食べてくれません。何かいい方法ありませんか。', user_id: users[1].id },
    {content: '小学生の息子ですが、宿題を中々してくれません。ついつい怒ってしまいます。', user_id: users[2].id },
  ]
)

Comment.create!(
  [
    {comment: "わかります。うちの子は５歳ですが今だにイヤイヤです。イライラしちゃいますよね。。", post_id: posts[0].id, user_id: users[1].id},
    {comment: "もう言わせとけばいいです。そのうち言わなくなります。", post_id: posts[0].id, user_id: users[2].id},
    {comment: "うちの子もかなり遅かったです。寝返りだけじゃなくて全て。", post_id: posts[1].id, user_id: users[2].id},
    {comment: "まず自分が超特急で洗って下の子を入れて、上の子は自分で洗ってもらう。マット的なのがあれば便利ですよね。", post_id: posts[2].id, user_id: users[1].id},
  ]
)

Item.create!(
  [
    {images:
      [
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item1.jpg"), filename:"sample-item1.jpg"),
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item2.jpg"), filename:"sample-item2.jpg")
      ], name: '冬用赤ちゃん', introduction: '男女兼用１００センチ 一回しか着ていません即購入おk!自宅保管のため神経質な方はご遠慮下さい', status: 'ほぼ新品', price: '3000', user_id: users[1].id},
    {images:
      [
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item3.jpg"), filename:"sample-item3.jpg"),
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item4.jpg"), filename:"sample-item4.jpg"),
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item5.jpg"), filename:"sample-item5.jpg")
      ], name: '男の子用', introduction: 'サイズが合わなくて出品します。試着程度しか着てないです。１２０センチ自宅保管の為気になる方はご遠慮下さい', status: 'ほぼ新品', price: '2500', user_id: users[0].id},
    {images:
      [
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item6.jpg"), filename:"sample-item6.jpg"),
        ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-item7.jpg"), filename:"sample-item7.jpg")
      ], name: '女の子用', introduction: 'サイズアウトしたので出品します。かなり着ているので神経してな方はご遠慮下さい', status: '傷や汚れあり', price: '1000', user_id: users[2].id}

  ]
)

