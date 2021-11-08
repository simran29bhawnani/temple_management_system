# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :configure_sign_in_params, only: [:create]

  def new
    # render "users/new"
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user&.valid_password? (params[:user][:password])
      if_an_active_employee
    else
      render :json => {:message => "you have entered wrong credentials"}
    end
  end
  
  def destroy
    if current_user 
      current_user.authentication_token = nil 
      current_user.save
      render :json => {:message => "you have succesfully logged out"}
    else
      render :json => {:message => "you have succesfully logged out"}
    end    
  end
  
  def if_an_active_employee
    if @user.active_status
      render json: @user.as_json
    else
      render :json => {:message => "not an active employee"}
    end
  end
end
