# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  50.times do |n|
    title = Faker::WorldCup.stadium
    content = Faker::Football.competition
    remark = Faker::Movie.quote
    user_id = 1
    the_day = Faker::Time.between(2.days.ago, Date.today, :all)

    Game.create(
      title: title,
      content: content,
      remark: remark,
      user_id: user_id,
      the_day: the_day
    )
  end

  User.create!(name: "Example User",
               email: "example@railstutorial.org",
               password:              "foobar",
               password_confirmation: "foobar",
               admin: true)

  20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password
                 )
  end

  Label.create!(game_lebel: 'エンジョイ')
  Label.create!(game_lebel: 'オープン')
  Label.create!(game_lebel: 'ガチ')
  Label.create!(game_lebel: 'メーカールアー限定')

  Label.create!(game_size: '小規模：２０人未満程度')
  Label.create!(game_size: '中規模：２０〜５０人程度')
  Label.create!(game_size: '大規模：５０人以上')

  Label.create!(game_event: 'おかっぱり')
  Label.create!(game_event: 'ボート')

  Area.create!(area: '北海道')
  Area.create!(area: '青森県')
  Area.create!(area: '岩手県')
  Area.create!(area: '宮城県')
  Area.create!(area: '秋田県')
  Area.create!(area: '山形県')
  Area.create!(area: '福島県')
  Area.create!(area: '茨城県')
  Area.create!(area: '栃木県')
  Area.create!(area: '群馬県')
  Area.create!(area: '埼玉県')
  Area.create!(area: '千葉県')
  Area.create!(area: '東京都')
  Area.create!(area: '神奈川県')
  Area.create!(area: '新潟県')
  Area.create!(area: '富山県')
  Area.create!(area: '石川県')
  Area.create!(area: '福井県')
  Area.create!(area: '山梨県')
  Area.create!(area: '長野県')
  Area.create!(area: '岐阜県')
  Area.create!(area: '静岡県')
  Area.create!(area: '愛知県')
  Area.create!(area: '三重県')
  Area.create!(area: '滋賀県')
  Area.create!(area: '京都府')
  Area.create!(area: '大阪府')
  Area.create!(area: '兵庫県')
  Area.create!(area: '奈良県')
  Area.create!(area: '和歌山県')
  Area.create!(area: '鳥取県')
  Area.create!(area: '島根県')
  Area.create!(area: '岡山県')
  Area.create!(area: '広島県')
  Area.create!(area: '山口県')
  Area.create!(area: '徳島県')
  Area.create!(area: '香川県')
  Area.create!(area: '愛媛県')
  Area.create!(area: '高知県')
  Area.create!(area: '福岡県')
  Area.create!(area: '佐賀県')
  Area.create!(area: '長崎県')
  Area.create!(area: '熊本県')
  Area.create!(area: '大分県')
  Area.create!(area: '宮崎県')
  Area.create!(area: '鹿児島県')
  Area.create!(area: '沖縄県')
  Area.create!(area: 'その他地域')
