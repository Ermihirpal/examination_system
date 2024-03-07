class SessionsController < ApplicationController
  # before_action :require_login, only: [:create, :new]
  
  def new
  end

  def create
    @user = Student.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to exams_path
    else
      flash[:notice] = "Login is invalid!"
      redirect_to '/login'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to root_path
  end
end
