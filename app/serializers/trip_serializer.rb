class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :location_history

  def location_history
    history = $redis.lrange("trip_#{object.id}_history", 0, -1).map{|location| JSON.parse(location) }
    history.reverse! 
  end
  
end
