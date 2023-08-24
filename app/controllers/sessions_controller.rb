class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email]) # This line goes here
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful!'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
