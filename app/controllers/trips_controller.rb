class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  def index
    trips = Trip.paginate(pagination_params)
    render json: trips, adapter: :json, each_serializer: TripSerializer, meta: pagination_response(trips), status: :ok
  end

  def show
    render json: @trip
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update(trip_params)
      render json: @trip, status: :ok
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
  end

  private
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:name, :description, :status, :user_id)
    end
end
