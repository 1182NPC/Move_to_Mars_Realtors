class AddUserReferenceToTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :user, foreign_key: true
  end
end
