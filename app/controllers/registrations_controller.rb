class RegistrationsController < ApplicationController
  def new
    @user= User.new
  end

  def create 
    # All the info that we fill in the form is send to backend in params and we can access it via params[:email] 
    # render plain: params[:user]
    @user= User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new 
      # it will render new.html.erb
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password, :password_confirmation)
  end
end