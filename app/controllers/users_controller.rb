class UsersController < ApplicationController
  before_action :set_user, only: %i[show following followers]

  def index
    @users = User.recent.search(params[:keyword]).page params[:page]
    @user = User.new
  end

  def show
    @tweets = @user.tweets.recent.page params[:page]
  end

  def following
    @users = @user.following.page params[:page]
    render 'show_follow'
  end

  def followers
    @users = @user.followers.page params[:page]
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
