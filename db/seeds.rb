# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

q = Question.create(username: "太郎", description: "みなさんの好きな食べ物はなんですか？")
a = Answer.create(username: "一郎", description: "お寿司")
q.answers << a
a = Answer.create(username: "二郎", description: "焼肉")
q.answers << a
a = Answer.create(username: "三郎", description: "ハンバーグ")
q.answers << a

q = Question.create(username: "プログラミング初学者", description: "アプリ開発ができるようになりたい初学者です。初心者におすすめのプログラミング言語を教えてください。")
a = Answer.create(username: "健太郎", description: "Ruby")
q.answers << a
a = Answer.create(username: "ユースケ", description: "JavaScript")
q.answers << a
a = Answer.create(username: "green_tea", description: "Python")
q.answers << a
