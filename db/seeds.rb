# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_names = [
                  'アニメ',
                  'ゲーム',
                  '海外ドラマ',
                  'スマホ全般',
                  '投資',
                  '国内旅行',
                  '海外旅行',
                  '漫画',
                  '車',
                  'バイク',
                  'ロードバイク・ロードレーサー'
                ]
category_names.each do |name|
  Category.create(name: name)
end

Category.all.each_with_index do |category, i|
  Board.create(category: category, title: "#{category.name}#{i}", owner:  "#{category.name}#{i}")
end

# Commentレコード作成
commentator_sign = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "H", "I"]
Board.all.each_with_index do |board, i|
  11.times do |j|
    Comment.create(board: board, text: "#{board.title}のコメント#{j}", commentator: "コメンテーター#{commentator_sign[j]}")
  end
end
