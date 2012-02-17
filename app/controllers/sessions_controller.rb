class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/admin'
    else
      redirect_to '/login', :alert => 'Invalid email/password combination'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
