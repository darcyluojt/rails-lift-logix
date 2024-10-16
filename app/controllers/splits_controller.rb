class SplitsController < ApplicationController
  def index
    @splits = Split.all
  end
end
