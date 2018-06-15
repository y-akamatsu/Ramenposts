class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @ramenpost = current_user.ramenposts.build
      @ramenposts = current_user.ramenposts.order('created_at DESC').page(params[:page])
    end
  end
end
