class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status
end
