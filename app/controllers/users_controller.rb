class UsersController < ApplicationController
  def index
    @users = User.recent.search(params[:keyword]).page params[:page]
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.recent.page params[:page]
  end
end
