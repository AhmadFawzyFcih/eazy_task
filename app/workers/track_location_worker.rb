class TrackLocationWorker
  include Sidekiq::Worker

  def perform(location_params)
    location = TripHistory.create(location_params)
    $redis.lpush("trip_#{location_params['trip_id']}_history", location.to_json)
  end
end
