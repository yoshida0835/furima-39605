class ApplicationController < ActionController::Base

  before_action :basic_auth

  # ログインしてなければサインイン画面へとばす

  # 初期登録外のカラムに値を保存
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    root_path
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
  end

  
end
