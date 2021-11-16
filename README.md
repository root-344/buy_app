# アプリ名

  ## ワケアリ(リメイク)

# 概要

  ### 商品の出品と購入

## ログイン情報（テスト用）

  ###  ・ 出品者用Eメール : test7@gmail.com
  ###  ・ 出品者パスワード : testtest1
  ###  ・ 購入者用Eメール : test6@gmail.com
  ###  ・ 購入者パスワード : testtest1

# 制作背景

### コロナ禍において、飲食店が受ける影響は計り知れないものがあり、私が勤めていた店舗でも売り上げの激減という事態になりました。<br>そんな中、店舗を守るためにできることはできるだけ安く食材を仕入れ、原価率を減らすということでした。そのために会社が契約している業者だけでなく、自分で行ける範囲のお店で一円でも安い食材を仕入れるということを行っていました。<br>私の勤めていた会社はまだ体力のある方でしたので何とか持ち直しましたが、次々に閉店していく個人経営の店舗をみて何かできることはないだろうかと考えていました。<br>そんな時、インターネットで訳あり商品を販売しているサイトを見つけた時、少しでも安くし野菜を購入したい店舗側と、品質には問題ないがスーパーなどに出品することの出来ない訳あり商品を少々安くてもいいから売りたい農家側とを繋げることができれば、お互いにメリットが生まれるのではないかと考えこのアプリケーションを開発してみようと思いました。<br>という思いで作った最初のアプリでしたが、まだよく解っていないまま既存のコードを利用して作っていたので、本当に１からデザインも含めて作り直してみようと考え、作成しました。


# DEMO
  
 ## トップページ（商品一覧画面） 
[![Image from Gyazo](https://i.gyazo.com/17c48d688e9d36c7be856afd82928ad2.jpg)](https://gyazo.com/17c48d688e9d36c7be856afd82928ad2) 
 
 ## 出品者新規登録動画
 ### 作成中

 
 ## 商品出品動画
 ### 作成中


 ## 詳細表示画面 ・編集・削除画面
 ### 作成中

 ## 購入画面
 ### 作成中
 
 ## 検索一覧画面
 ### 作成中
 
 ## 出品者マイページ画像  


 ## 購入者マイページ画像  
 ### 作成中


# このアプリで表現させたいポイント
 
  ### ・シンプルで分かりやすい表示
 
  ### ・全て日本語（これどういうこと？と思わせないように表現する）で表示させる。

# 使用技術

 ## バックエンド

  ### Ruby, Ruby on Rails

 ## フロントエンド

  ### HTML, CSS, SCSS, JavaScript, 

 ## Webサーバー（本番環境）
  
  ### heroku

 ## ソース管理

  ### GitHub, GitHubDesktop

 ## テスト

  ### RSpec

 ## エディタ
 
  ### VSCode


# DB設計


## farms テーブル

| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association

- has_many :items

## stores テーブル

| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |

### Association

- has_many :orders

## itemsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| product                | string     | null: false                    |
| farm                   | reference  | null: false, foreign_key: true |
| description            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| states_id              | integer    | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| region_id              | integer    | null: false                    |
| eta_id                 | integer    | null: false                    |
| price                  | integer    | null: false                    |

### Association

- has_one :order
- belongs_to :farm


## orders テーブル

| Column   | Type      | Options                       |
| -------- | --------- | ----------------------------- |
| store    | reference | null:false, foreign_key: true |
| item     | reference | null:false, foreign_key: true |

### Association

- belongs_to :store
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| zip              | string     | null: false                   |
| region_id        | integer    | null: false                   |
| city             | string     | null: false                   |
| house_number     | string     | null: false                   |
| building_number  | string     | null: false                   |
| phone            | integer    | null: false                   |
| order            | reference  | null:false, foreign_key: true |

- belongs_to :order