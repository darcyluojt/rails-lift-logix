class SplitsController < ApplicationController
  def index
    @programme = Programme.find(params[:programme_id])
    @splits = Programme.splits
  end

  def show
    @split = current_user.programmes.last.splits.first
    # get all exercises except for @split.split_exercises and for the correct category
    if @split.category == "Fullbody"
      @exercises = Exercise.all
    else
      @exercises = Exercise.where("'#{@split.category}' = ANY(category_array)")
    end
    @exercises =  @exercises - @split.exercises
    @split_exercise = SplitExercise.new
    if @split.programme.splits.last == @split
      @next_split = nil
    else
      @next_split = @split.programme.splits.where("id > ?", @split.id).first
    end
  end

  private
  def strong_params
    params.require(:split).permit(exercise_ids: [])
  end

end
