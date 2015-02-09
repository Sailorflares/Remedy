class ConditionsController < ApplicationController

  def create
    @condition = Condition.find_or_create_by(name: params["condition"]["name"])
    @condition.users << current_user
    redirect_to home_url(current_user.id)
  end

  def show
    @condition = Condition.find(params["id"])
  end

  def index
    @conditions = Condition.all
  end
end
