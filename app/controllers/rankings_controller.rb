class RankingsController < ApplicationController
  def like
    @ranking_counts = Like.ranking
    @like_rankings = Ramenpost.find(@ranking_counts.keys)
  end
end
