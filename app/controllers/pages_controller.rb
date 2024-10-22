class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def account
    # get user's workout programmes
    @user = current_user
    @programmes = @user.programmes.sort_by(&:created_at).reverse
    # fetch exercise log data that user has entered in all programmes / splits / workouts
    @splits = @user.splits
    @exercises = @splits.map { |split| split.exercises }.flatten.uniq
    @exercises = @exercises.reject { |exercise| exercise.logs.empty? }
    # present the workout calendar view
    start_date = params.fetch(:start_date, Date.today).to_date
    @workouts = Workout.includes(split: { programme: :user }).where(date: start_date.beginning_of_month..start_date.end_of_month)
  end
end
