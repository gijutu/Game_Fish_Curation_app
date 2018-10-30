# README
# 釣りカラ

## 概要
* 釣り人のための大会情報共有アプリ
* 全国の大会情報の閲覧
* ローカル大会の開催

## コンセプト
* "ちょっと大会にでてみようかな"と気軽に大会に参加できる
* 全国の釣り大会情報を知ることができる
* ユーザー同士がコミュニケーションをとれる

## 開発環境、ミドルウェアなど
* Ruby 2.5.1
* Ruby on Rails 5.2.1

### セットアップ
* cd Tournament_Curation_app
* bundle install --path vendor/bundler
* heroku create
* heroku run rails db:migrate

### herokuへデプロイ
* gitへコミット
* herokuでアプリケーション作成(heroku create)
* アセットをコンパイル(rails assets:precompile RAILS_ENV=production)
* herokuへデプロイ(git push heroku master)
* heroku へデータベース移行(heroku run rails db:migrate)

## 機能一覧
### ファイルのアップロード及び、記事投稿機能
* ログイン時のみ有効、管理者の許可が出るまで記事がでない
### 記事の検索、ソート機能
* ラベルやフリーワードで検索
* 更新日と大会開催日でソート
### ユーザー、管理者ログイン機能
* メールアドレス、名前、パスワードは必須
### 投稿者へのユーザー情報の送信
* ユーザーの登録情報が投稿者に送信
### 投稿記事のお気に入り機能
### SNSログイン機能
* FBでのログイン
### ラベル機能
* 管理者作成の任意のラベル
### 投稿記事へのいいね機能
### コメント機能
### ユーザーのフォロー機能
### ユーザーのコメントへのいいね機能

## カタログ設計
https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=1508007624

## テーブル定義
* ER図 https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=417603808
* users https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=0
* blogs https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=1880657455
* labels https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=430892568
* labelings https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=1435250451       
* entries https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=1274565312
* favorites https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=1404168538
* comments https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=1492069349
* relationship https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=165295685

## 画面遷移図
https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=834611570

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/18v5fRwqECKKTPwerFg0a2pxOZowgxzGF1RqXsVcWuSA/edit#gid=764973864

## 使用予定Gem
* gem 'devise'
* gem 'ransack'
* gem 'kaminari'
* gem 'mini_magick'
* gem 'carrierwave'
* gem 'rails_admin'
* gem 'cancancan'
