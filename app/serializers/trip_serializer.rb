class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :location_history

  def location_history
    history = $redis.lrange("trip_#{object.id}_history", 0, -1)
    if(history.length > 0)
      result = []
      history.each{|location| result.push(JSON.parse(location))}
      history = result.flatten
    else
      history = object.trip_histories
      $redis.lpush("trip_#{object.id}_history", history.to_json)
    end
    history 
  end
  
end
