class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.float :payment
      t.date :start_date
      t.date :end_date
      t.references :user, index: true, foreign_key: true
      t.string :profile_url
      t.string :location
      t.string :first_name
      t.string :height
      t.string :weight
      t.string :ethnicity
      t.string :skin_color
      t.string :eye_color
      t.string :chest
      t.string :waist
      t.string :hips
      t.string :shoe_size
      t.string :hair_colour
      t.string :hair_length
      t.string :hair_type
      t.string :dress_size

      t.timestamps null: false
    end
  end
end
