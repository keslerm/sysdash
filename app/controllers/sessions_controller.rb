class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if (user && user.password == params[:session][:password])
      # Login
      session[:user_id] = user.id
      redirect_to dashboard_index_url
    else
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy

  end
end
