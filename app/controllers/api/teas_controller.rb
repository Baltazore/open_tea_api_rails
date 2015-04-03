class Api::TeasController < ApplicationController
  def index
    render json: Tea.all
  end

  def show
    render json: Tea.find(params[:id])
  end
end
