class CreateTravelnotes < ActiveRecord::Migration
  def change
    create_table :travelnotes do |t|
      t.string :notename
      t.integer :owner
      t.string :locale
      t.string :content

      t.timestamps
    end
  end
end
