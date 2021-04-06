# SkillTest

"SkillTest" はクローンアプリです。

# 特徴

Rails で HTML を返しています。

# 画面構成

* ログイン画面
 * メールアドレスとパスワードによるログイン
 * ログインを記憶するチェックボックスあり
 * ログイン中はアクセス出来ない（トップページへリダイレクトする）
 * ログインに成功した場合、メッセージが表示される
 * 新規作成ページのリンクあり

* アカウント新規作成画面
 * メールアドレス、パスワード、パスワードの確認で作成される
 * 情報が足りていない場合、新規作成ができない
 * 足りていない情報についてエラーメッセージが表示される
 * ログイン中はアクセス出来ない（トップページへリダイレクトする）
 * ログインページのリンクあり

* トップページ
 * ログイン中のユーザーのメールアドレスが表示される
 * ログイン中でないとアクセスできない（ログインページにリダイレクトされる）
 * ログアウトボタンの表示（ログアウト後にメッセージが表示される）

* 共通
 * エラーメッセージも含めて日本語で表示される
 * ログイン機能は Gem Devise を使用
 * デザインは Bootstrap4 を使用
 * ログイン中のみヘッダーが表示される

# 注意点

* ログアウト
No route matches [GET] "/users/sign_out" とエラー表示される時、ルーティングの変更を行う
```routes.rb
devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
```

* flashメッセージ
ログアウト後にトップページへリダイレクトして、エラーメッセージが表示されるためリダイレクト先を変更する
ログアウト後のリダイレクト先
```application_controller.rb
class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end
end
```
