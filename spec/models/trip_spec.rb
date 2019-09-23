require 'rails_helper'

RSpec.describe Trip, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:status)}
    it "change trip status" do
      trip = Trip.create(name: "trip 1", status: 1)
      trip.update(status: 0)
      expect(trip.errors[:status][0]).to eq("you cannot update trip status after it completed")
    end
  end
end
