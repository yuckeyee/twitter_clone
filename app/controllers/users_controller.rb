class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order('created_at desc')
  end

  def search
    @users = User.search(params[:name])
    render action: :index
  end
end
