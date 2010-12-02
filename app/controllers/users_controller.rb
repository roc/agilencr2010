class UsersController < ApplicationController

	include ApplicationHelper

  before_filter :admin_user, :only => [:index, :show, :edit, :update]

  def new
    @user = User.new()
  end

  def create
    @user = User.new(params[:user])
		
    if @user.save
      flash[:success] = "User created successfully. Please login in."
      @user = User.new()
      redirect_to signin_path
    else
      render 'new'
    end
  end

#  def show
#    @user = User.find(params[:id])
#  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User updated."
      redirect_to users_path
    else
      render 'edit'
    end
  end

end
