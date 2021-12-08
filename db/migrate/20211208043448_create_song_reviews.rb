class CreateSongReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :song_reviews do |t|
      t.integer :user_id
      t.string :body
      t.string :title
      t.string :stars
      t.integer :song_id

      t.timestamps
    end
  end
end
