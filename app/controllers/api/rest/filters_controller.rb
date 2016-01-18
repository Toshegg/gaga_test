class Api::Rest::FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :update, :destroy]

  def index
    @filters = current_user.filters.all

    respond_with @filters
  end

  def show
    respond_with @filter
  end

  def create
    @filter = current_user.filters.create(filter_params)

    respond_with @filter
  end

  def update
    @filter.update(filter_params)

    respond_with @filter
  end

  def destroy
    @filter.destroy

    head :no_content
  end

  private
    def set_filter
      @filter = Api::Rest::Filter.find(params[:id])

      head(403) unless @filter.user == current_user
    end

    def filter_params
      params.require(:filter).permit(:value, :name)
    end
end
