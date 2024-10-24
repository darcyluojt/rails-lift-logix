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
    # fetch logs for the exercises that the user has logged
    @user_logs = Log.joins(split_exercise: :exercise) # Join split_exercise to exercise
                    .joins(workout: { split: { programme: :user } }) # Join workout -> split -> programme -> user
                    .where(users: { id: current_user.id }, split_exercises: { exercise_id: @exercises.map(&:id) })
    # reject exercises that have no logs in @user_logs
    @exercises = @exercises.reject do |exercise|
      @user_logs.none? do |log|
        log.split_exercise.exercise_id == exercise.id
      end
    end
    # present the workout calendar view
    start_date = params.fetch(:start_date, Date.today).to_date
    # Both lines below give back the same data, rather than the logged workouts for the current user @ Darcy
    # @workouts = Workout.includes(split: { programme: :user }).where(date: start_date.beginning_of_month..start_date.end_of_month)
    # @workouts = Workout.all
    @workouts = Workout
                .joins(split: { programme: :user })
                .where(user: { id: @user.id })
                .where(date: start_date.beginning_of_month..start_date.end_of_month)
  end
end
