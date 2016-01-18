class Api::Rest::MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :update, :destroy]

  def index
    @meetings = Api::Rest::Meeting.filtered_by(filter_params.merge(ip: request.remote_ip)).ordered_by(order_params.merge(ip: request.remote_ip)).uniq

    respond_with @meetings
  end

  def show
    respond_with @meeting
  end

  def create
    @meeting = Api::Rest::Meeting.create(meeting_params)

    @meeting.games << Api::Rest::Game.find(games_params[:games_ids]) if games_params[:games_ids].present?

    respond_with @meeting
  end

  def update
    @meeting.update(meeting_params)

    @meeting.games = Api::Rest::Game.find(games_params[:games_ids]) if games_params[:games_ids].present?

    @meeting.save
    
    respond_with @meeting
  end

  def destroy
    @meeting.destroy

    head :no_content
  end

  private
    def set_meeting
      @meeting = Api::Rest::Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :starts_at, :ends_at, :lat, :lng)
    end

    def games_params
      params.require(:meeting).permit(games_ids: [])
    end

    def filter_params
      params.permit(:name, :hour_from, :hour_to, :weekday, :lat, :lng, :distance, games_ids: [])
    end

    def order_params
      params.permit(:order, :lat, :lng)
    end

end
