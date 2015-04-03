class Api::TeasController < ApplicationController
  def index
    render json: Tea.all
  end

  def show
    render json: Tea.find(params[:id])
  end

  def create
    @tea = Tea.new tea_params
    if @tea.create
      render json: @tea
    else
      render nothing: true, status: 403
    end
  end

  def update
    @tea = Tea.find(params[:id])
    @tea.assign_attributes tea_params

    if @tea.update
      render json: @tea
    else
      render json: @tea, status: 403
    end
  end

  def destroy
    @tea = Tea.find(params[:id])

    if @tea.destroy
      render nothing: true, status: 200
    else
      render nothing: true, status: 403
    end
  end
end
