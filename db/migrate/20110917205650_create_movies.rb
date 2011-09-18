class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :score
      t.boolean :will_shit_your_pants 
      t.string :poster_url
      t.timestamps
    end
  end
end
