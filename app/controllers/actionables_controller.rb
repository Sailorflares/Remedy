class ActionablesController < ApplicationController

  def new
    @actionable = Actionable.new
  end

  def create
    @actionable = Actionable.create(title: params["actionable"]["title"], text: params["actionable"]["text"])
    if @actionable
      current_user.actionables << @actionable
      condition = Condition.find(params["actionable"]["condition"]["id"]) 
      @actionable.conditions << condition if condition
      redirect_to home_url(current_user.id)
    else
      #need to redirect somewhere if something goes wrong here
    end
  end

  def index
    @actionables = Actionable.all
  end

end
