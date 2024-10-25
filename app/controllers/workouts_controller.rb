class WorkoutsController < ApplicationController
  def index
    if current_user.programmes.empty?
      # pop an alert
      flash[:alert] = "Please create a programme first"
      redirect_to new_programme_path
    else
      @programme = Programme.find(params[:programme_id])
      @splits = @programme.splits
      @workout = Workout.new
    end
  end

  def new
    @splits = current_user.splits
    @workout = Workout.new
  end

  def create
    if params[:split_id] # This means the request came from the nested route
      @workout = Workout.new
      @workout.split = Split.find(params[:split_id])
      @workout.date = Date.today
      @workout.done = false
      if @workout.save
        redirect_to workout_logs_path(@workout), notice: "You can start lifting now!"
      else
        render 'index', status: :unprocessable_entity
      end
    else # This is the top-level workout creation
      @workout = Workout.new(workout_params)
      if @workout.save
        redirect_to account_path, notice: "Your workout has been scheduled!"
      end
    end
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.done = true
    @workout.save
  end

  private

  def workout_params
    params.require(:workout).permit(:split_id, :date)
  end
end
