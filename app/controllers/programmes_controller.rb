class ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
    @programme.splits.build
  end

  def create
    @programme = Programme.new(programme_params)
    @programme.user = current_user
    @programme.save
    # programme.new
    # programme.splits.build(category: "push")
    # programme.splits.build(category: "pull")

  end

  private

  def programme_params
    params.require(:programme).permit(:name, :weeks, :splits_per_week, splits_attributes: [:category])
  end
end
