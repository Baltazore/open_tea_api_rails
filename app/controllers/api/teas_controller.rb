class Api::TeasController < ApplicationController
  def index
    render json: Tea.all
  end

  def show
    render json: Tea.find(params[:id]), status: 200
  end

  def create
    @tea = Tea.new tea_params

    if @tea.save
      render json: @tea, status: 200
    else
      render json: :empty, status: 403
    end
  end

  def update
    @tea = Tea.find(params[:id])
    @tea.assign_attributes tea_params

    if @tea.save
      render json: @tea, status: 200
    else
      render json: @tea, status: 403
    end
  end

  def destroy
    @tea = Tea.find(params[:id])

    if @tea.destroy
      render json: :empty, status: 200
    else
      render json: :empty, status: 403
    end
  end

  protected
    def tea_params
      params.require(:tea).permit(:name, :description)
    end
end
