# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tag1 = Tag.create!(name: "小説")
tag2 = Tag.create!(name: "実用書")
tag3 = Tag.create!(name: "漫画")
tag4 = Tag.create!(name: "専門書")
tag5 = Tag.create!(name: "スポーツ")

author1 = Author.create!(name: "田中太郎", description: "あいうえお")
author2 = Author.create!(name: "山田花子", description: "かきくけこ")
author3 = Author.create!(name: "佐藤健", description: "さしすせそ")
author4 = Author.create!(name: "オダギリジョー", description: "たちつてと")
author5 = Author.create!(name: "中井学", description: "なにぬねの")

book1 = Book.create!(title: "いい本", description: "アイウエオ")
book2 = Book.create!(title: "とてもいい本", description: "カキクケタ")
book3 = Book.create!(title: "面白い本", description: "サシスセソ")
book4 = Book.create!(title: "簡単な本", description: "タチツテト")
book5 = Book.create!(title: "難しい本", description: "ナニヌネノ")
book6 = Book.create!(title: "マイブック", description: "ハヒフヘホ")
book7 = Book.create!(title: "いつか見た景色", description: "マミムメモ")
book8 = Book.create!(title: "いい感じの日常", description: "ヤユヨ")
book9 = Book.create!(title: "my book", description: "ラリルレロ")
book10 = Book.create!(title: "歩み", description: "ワ・ヲ・ン")

RlBookTag.create!(book: book1, tag: tag1)
RlBookTag.create!(book: book1, tag: tag5)
RlBookTag.create!(book: book2, tag: tag2)
RlBookTag.create!(book: book3, tag: tag3)
RlBookTag.create!(book: book4, tag: tag4)
RlBookTag.create!(book: book4, tag: tag2)
RlBookTag.create!(book: book5, tag: tag5)
RlBookTag.create!(book: book6, tag: tag1)
RlBookTag.create!(book: book7, tag: tag2)
RlBookTag.create!(book: book8, tag: tag3)
RlBookTag.create!(book: book9, tag: tag4)
RlBookTag.create!(book: book10, tag: tag5)

RlBookAuthor.create!(book: book1, author: author1)
RlBookAuthor.create!(book: book1, author: author5)
RlBookAuthor.create!(book: book2, author: author2)
RlBookAuthor.create!(book: book2, author: author5)
RlBookAuthor.create!(book: book3, author: author3)
RlBookAuthor.create!(book: book4, author: author4)
RlBookAuthor.create!(book: book5, author: author5)
RlBookAuthor.create!(book: book6, author: author1)
RlBookAuthor.create!(book: book7, author: author2)
RlBookAuthor.create!(book: book8, author: author2)
RlBookAuthor.create!(book: book9, author: author2)
RlBookAuthor.create!(book: book10, author: author4)
