class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order('created_at desc')
  end

  def create
    if current_user.tweets.create(tweet_params)
      flash[:notice] = '投稿しました'
    else
      flash[:error] = '投稿に失敗しました'
    end

    redirect_to :root
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
