class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.references :user

      t.timestamps
    end
    add_foreign_key :workouts, :users
  end
end
