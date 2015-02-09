class FeelingsController < ApplicationController

  def create
    @feeling = Feeling.create(user_id: current_user.id, rating: params["feeling"]["rating"], date_feeling: Date.today)
    current_user.feelings << @feeling
    redirect_to home_url(current_user.id)
  end

end
