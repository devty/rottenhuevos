class CreateManpacks < ActiveRecord::Migration
  def change
    create_table :manpacks do |t|
      t.string :name
      t.string :api_key
      t.date :next_order
      t.integer :times_shat_self

      t.timestamps
    end
  end
end
