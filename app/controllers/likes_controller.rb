class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    ramenpost = Ramenpost.find(params[:ramenpost_id])
    current_user.like(ramenpost)
    flash[:success] = 'likeを追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    ramenpost = Ramenpost.find(params[:ramenpost_id])
    current_user.unlike(ramenpost)
    flash[:success] = 'likeを解除しました。'
    redirect_back fallback_location: root_path
  end
end