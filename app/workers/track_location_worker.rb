class TrackLocationWorker
  include Sidekiq::Worker

  def perform(location, trip_id)
    $redis.lpush("trip_#{trip_id}_history", location.to_json)
  end
end
