# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  #def create
  #  omniauth_callbacks
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #protected

  #def omniauth_callbacks
  #  @user = User.from_omniauth(request.env['omniauth.auth'])
  #  if @user.persisted?
  #    sign_in_and_redirect @user, event: :authentication
  #  end
  #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
