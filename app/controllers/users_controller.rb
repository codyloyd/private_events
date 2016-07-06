class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email])
    if @user.save
      flash[:success] = "Account Created"
      log_in @user
      redirect_to @user
    else
      flash.now[:error] = "oops, something broke (try again)"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events_created = @user.events_created.all
    @events_attending = @user.events_attending.all
  end

  def index
    @users = User.all
  end
end
