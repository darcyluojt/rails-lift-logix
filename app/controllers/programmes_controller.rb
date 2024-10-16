class ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
  end

  def create
    @programme = Programme.create(programme_params)
    # programme.new
    # programme.splits.build(category: "push")
    # programme.splits.build(category: "pull")

  end

  private

  def programme_params
    params.require(:programme).permit(:name, :weeks, :splits_per_week, :splits_attributes)
  end
end
