class HomeController < ApplicationController
  # ログインしていない場合ログイン画面へ移動させる
  before_action :authenticate_user!

  def index
  end
end
