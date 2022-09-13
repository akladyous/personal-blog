class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend

  def new
  end

  def create
  end

  def destroy
  end

  private
  def set_friend
    @friend = User.find(params[:id])
  end
end


