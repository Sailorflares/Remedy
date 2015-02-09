class FeelingsController < ApplicationController

  def create
    @feeling = Feeling.create(user_id: current_user.id, rating: params["feeling"]["rating"], date_feeling: Date.today)
    if @feeling
      current_user.feelings << @feeling
      redirect_to home_url(current_user.id)
    else
      #need to redirect somewhere if something goes wrong here
    end
  end

end
