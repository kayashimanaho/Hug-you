# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'kayashi0624@test.com',
   password: 'hogehoge'
)

users = User.create!(
  [
    {email: 'kayashima@test.com', name: '萱島 菜穂', nick_name: 'かやし', postal_code: '1111111',address: '大分県大分市大在町0-0', age: '25', from: '大分県',introduction: '初めまして！よろしくお願いします', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'ashida@test.com', name: '芦田 愛菜', nick_name: 'まなちゃん', postal_code: '8730555',address: '東京都渋谷区0-0', age: '15', from: '東京都',introduction: '初めまして！いろんな方と繋がりたいです', password: '000000', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'akashi@test.com', name: '明石 ちはる', nick_name: 'ちゃあちゃん', postal_code: '8670233',address: '北海道札幌２−３', age: '32', from: '北海道',introduction: '同じ月齢の方と仲良くしたいです', password: '777777', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Post.create!(
  [
    {post: '３歳の娘が中々言う事を聞いてくれません。毎日イヤイヤ期です', user_id: users[1].id },
    {post: '下の子が寝返りがまだできないです。もう半年過ぎたのにできなくて大丈夫かなと不安です。成長が遅かった方いますか', user_id: users[1].id },
    {post: '二人育児の方、一人でお風呂はどうしていますか。スムーズなやり方教えて下さい', user_id: users[1].id },
    {post: '野菜が嫌いすぎて何も食べてくれません。何かいい方法ありませんか。', user_id: users[2].id },
    {post: '小学生の息子ですが、宿題を中々してくれません。ついつい怒ってしまいます。', user_id: users[3].id },
  ]
)

Comment.create!(
  [
    {comment: "わかります。うちの子は５歳ですが今だにイヤイヤです。イライラしちゃいますよね。。", post_id: posts[1], user_id: users[2]},
    {comment: "もう言わせとけばいいです。そのうち言わなくなります。", post_id: posts[1], user_id: users[3]},
    {comment: "うちの子もかなり遅かったです。寝返りだけじゃなくて全て。", post_id: posts[2], user_id: users[1]},
    {comment: "まず自分が超特急で洗って下の子を入れて、上の子は自分で洗ってもらう。マット的なのがあれば便利ですよね。", post_id: posts[3], user_id: users[2]},
  ]
)