class ChartsController < ApplicationController
  def create

  end



  def chart_params
    params.permit(:first_name, :middle_name, :last_name, :birthdate)
  end
end
