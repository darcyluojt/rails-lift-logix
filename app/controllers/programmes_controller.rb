class ProgrammesController < ApplicationController
  def show
    @programme = Programme.find(params[:id])
    @splits = @programme.splits
  end

  def new
    @programme = Programme.new
    @programme.splits.build
  end

  def create
    @programme = Programme.new(programme_params)
    @programme.user = current_user
    @programme.save!

    redirect_to programme_splits_path(@programme)

  end

  private

  def programme_params
    params.require(:programme).permit(:name, :weeks, :splits_per_week, splits_attributes: [:category])
  end
end
