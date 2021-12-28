# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])
    if user.present? && user.valid_password?(params[:user][:password])
      render json: user.as_json(only: [:email, :authentication_token])
    else
      render json: {message: 'Invaild credentials!'}
    end
  end

  # DELETE /resource/sign_out
  def destroy
    render json: {message: 'Successfully logout'}
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
