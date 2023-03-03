# アプリケーション名
FURIMA-39010


# アプリケーション概要
ユーザー間で商品の売買が行えるフリマアプリ


# URL
https://furima-39010.onrender.com


# テスト用アカウント
・Basic認証パスワード： 2222

・Basic認証ID： admin

・PAYJP_PUBRIC_KEY：59213395c5f3c7620951a6e31e90f5af

・PAYJP_SECRET_KEY：59213395c5f3c7620951a6e31e90f5af


# 利用方法
## 商品出品
1.トップページのヘッダーからユーザー新規登録を行う。

2.出品ボタンから商品情報（画像、商品名、商品説明、商品詳細（カテゴリ、状態）、販売価格）を入力する。

3.出品ボタンを押す。

## 商品購入
1.商品詳細ページで購入画面に進むボタンを押し、クレジットカード情報と配送先を入力する。

2.購入ボタンを押したら購入完了。


# テーブル設計
## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| nickname           | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| last_name          | string      | null: false               |
| first_name         | string      | null: false               |
| kana_last_name     | string      | null: false               |
| kana_first_name    | string      | null: false               |
| birthday           | date        | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column        | Type              | Options                        |
| ------------- | ----------------- | ------------------------------ |
| title         | string            | null: false                    |
| description   | text              | null: false                    |
| category_id   | integer           | null: false                    |
| condition_id  | integer           | null: false                    |
| ship-fee_id   | integer           | null: false                    |
| prefecture_id | integer           | null: false                    |
| ship_date_id  | integer           | null: false                    |
| price         | integer           | null: false                    |
| user          | references        | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment

## payments テーブル

| Column         | Type              | Options                        |
| -------------- | ----------------- | ------------------------------ |
| post_cord      | string            | null: false                    |
| prefecture_id  | integer           | null: false                    |
| municipalities | string            | null: false                    |
| address        | string            | null: false                    |
| building       | string            |                                |
| phone_number   | string            | null: false                    |
| order          | references        | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


# ER図
[![Image from Gyazo](https://i.gyazo.com/f630ef76d4d6c7e0d6bd8fee5c1acbb0.png)](https://gyazo.com/f630ef76d4d6c7e0d6bd8fee5c1acbb0)