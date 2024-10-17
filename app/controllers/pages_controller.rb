class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def account
    @user = current_user
    @programmes = @user.programmes.sort_by(&:created_at).reverse
    @splits = @user.splits
    @exercises = @splits.map { |split| split.exercises }.flatten.uniq
    @exercises = @exercises.reject { |exercise| exercise.logs.empty? }
  end
end
