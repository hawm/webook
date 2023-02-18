class LoginsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    @user = authenticate

    if @user&.authenticate(user_params[:password])&.present?
      session[:current_user_id] = @user.id
      redirect_to root_url, notice: 'You have successfully logged in.'
    else
      redirect_to login, status: :unauthorized,
                         alert: 'Your username/password is invalid'
    end
  end

  def logout; end

  def destory
    session.delete(:current_user_id)
    @current_user = nil
    redirect_to root_url, notice: 'You have successfully logged out.'
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:username, :password)
  end

  def authenticate
    User.find_or_initialize_by(username: user_params[:username]) do |u|
      u.skip_username_validations = true
    end
  end
end
