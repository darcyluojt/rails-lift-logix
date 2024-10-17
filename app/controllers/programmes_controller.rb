class ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
    @programme.splits.build
  end

  def create
    @programme = Programme.new(programme_params)
    @programme.user = current_user
    @programme.save
    redirect_to split_path(@programme.splits.first)

  end

  private

  def programme_params
    params.require(:programme).permit(:name, :weeks, :splits_per_week, splits_attributes: [:category])
  end
end
