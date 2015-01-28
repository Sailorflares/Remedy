class ConditionsController < ApplicationController

  def create
    @condition = Condition.find_or_create_by(name: params["condition"]["name"])
    if @condition
      @condition.users << current_user
    else
      #need to redirect somewhere if something goes wrong here
    end
    redirect_to home_url(current_user.id)
  end

  def show
    @condition = Condition.find(params["id"])
  end

  def index
    @conditions = Condition.all
  end
end
