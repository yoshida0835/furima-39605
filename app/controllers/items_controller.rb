class ItemsController < ApplicationController

  # ログインしてなければサインイン画面へとばす
  before_action :authenticate_user!, except: [:index]

  def index
  end
end
