class CreateMicropictures < ActiveRecord::Migration
  def change
    create_table :micropictures do |t|
      t.integer :micropost_id

      t.timestamps
    end
  end
end
