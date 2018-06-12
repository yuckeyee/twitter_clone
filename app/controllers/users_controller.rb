class UsersController < ApplicationController
  def index
    @users = User.recent.page params[:page]
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.recent
  end

  def search
    @users = User.recent.search(params[:search]).page params[:page]
    render action: :index
  end
end
