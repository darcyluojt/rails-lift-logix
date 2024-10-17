class WorkoutsController < ApplicationController

  def index
    @splits = Split.all
    @workout = Workout.new
  end

  def create
    @workout = Workout.new
    @workout.split = Split.find(params[:split_id])
    @workout.date = Date.today
    @workout.done = false
    @workout.save
  end
end
