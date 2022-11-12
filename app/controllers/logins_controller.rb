class LoginsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(username: user_params[:username])

    if @user&.authenticate(user_params[:password])&.present?
      session[:current_user_id] = @user.id
      redirect_to root_url, notice: 'You have successfully logged in.'
    else
      flash[:alert] = 'Your username/password is invalid'
      render :index, status: :unprocessable_entity
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

end
