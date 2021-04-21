class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!    # ログイン済ユーザーのみにアクセスを許可する

    before_action :configure_permitted_parameters, if: :devise_controller? # deviseコントローラーにストロングパラメータを追加する


    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      added_attrs = [ :email, :account, :password ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      #devise_parameter_sanitizer.permit(:account_update, keys: [:account])
    end

end
