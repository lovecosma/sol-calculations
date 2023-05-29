class ChartsController < ApplicationController
  def create

  end



  def chart_params
    params.permit(:first, :middle, :last, :birthdate)
  end
end
