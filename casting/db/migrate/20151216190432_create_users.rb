class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :image
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
