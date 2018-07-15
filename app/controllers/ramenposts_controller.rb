class RamenpostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @ramenpost = current_user.ramenposts.build(ramenpost_params)
    if @ramenpost.save
      flash[:success] = 'ラーメンを投稿しました。'
      redirect_to user_path(current_user)
    else
      @ramenposts = current_user.ramenposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'ラーメンの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @ramenpost.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def ramenpost_params
    params.require(:ramenpost).permit(:content, :image, :menu, :restaurant_name, :star)
  end
  
  def correct_user
    @ramenpost = current_user.ramenposts.find_by(id: params[:id])
    unless @ramenpost
     redirect_to root_url
    end
  end
end
