class CheckInsController < ApplicationController

  def create
    params["check_in"]["actionable_ids"].each do |id|
      CheckIn.create(user_id: current_user.id, date: Date.today, actionable_id: id)
    end
    redirect_to home_url(current_user.id) 
  end

end