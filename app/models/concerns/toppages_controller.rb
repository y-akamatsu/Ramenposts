class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @ramenpost = current_user.ramenposts.build
      @ramenposts = Ramenpost.includes(:evaluations).order('created_at DESC').page(params[:page])
    end
  end
end
