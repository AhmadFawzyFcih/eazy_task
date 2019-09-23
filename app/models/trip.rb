class Trip < ApplicationRecord
    enum status: [:ongoing, :completed]
    validates :status, presence: true, inclusion: { in: Trip.statuses.keys }
    validate  :trip_is_completed, on: :update


    private
    def trip_is_completed
        if (status == "ongoing" && status_was == "completed")
            errors.add(:status, 'you cannot update trip status after it completed')
        end
    end
end
