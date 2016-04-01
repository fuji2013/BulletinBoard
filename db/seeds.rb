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
Board.all.each_with_index do |board, i|
  Comment.create(board: board, text: "#{board.title}のコメント#{i}", commentator: "コメンテーターA")

  Comment.create(board: board, text: "#{board.title}のコメント#{i}", commentator: "コメンテーターB")
end
