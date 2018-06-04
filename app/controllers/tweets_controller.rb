class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order('created_at desc').page params[:page]
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to :root, notice: '投稿しました'
    else
      @tweets = Tweet.order('created_at desc').page params[:page]
      flash.now[:alert] = '投稿に失敗しました'
      render :index
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path, notice: '削除しました'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
