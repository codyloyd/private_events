class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email])
    if @user.save
      flash[:success] = "Account Created"
      redirect_to root_url
    else
      flash.now[:error] = "oops, something broke (try again)"
      render 'new'
    end
  end

  def show
  end
end
