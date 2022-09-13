class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend

  def new
    current_user.request_friend(@user)
    redirect_back_or_to root_path
  end

  def create
    current_user.accept_friend(@user)
    redirect_back_or_to root_path
  end

  def destroy
    current_user.reject_friend(@user)
    redirect_back_or_to root_path
  end

  private
  def set_friend
    @user = User.find(params[:id])
  end
end


