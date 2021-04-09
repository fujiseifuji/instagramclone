class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE ?', "%#{params[:search]}%")
    @posts = User.where('content LIKE ?', "%#{params[:search]}%")
  end

  def show
    @user = User.find_by(id: params[:id])
    @post  = current_user.posts.build
    @feed_items = current_user.feed
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end
end
