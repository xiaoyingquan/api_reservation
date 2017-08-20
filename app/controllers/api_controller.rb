class ApiController < ActionController::Base

  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!

    if params[:auth_token].present?
      user = User.find_by_authentication_token( params[:auth_token] )

      # sign_in 是 Devise 的方法，会设定好 cuurent_user
      sign_in(user, store: false) if user
    end 
  end
end