class EvaluationsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    star = params[:score]
    ramenpost = Ramenpost.find(params[:ramenpost_id])
    evaluation = current_user.evaluations.find_or_create_by(ramenpost_id: ramenpost.id)
    evaluation.update(star: star) if star
    redirect_back(fallback_location: root_url)
  end
end
