class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.integer :localetype
      t.string :localename
      t.integer :parent

      t.timestamps
    end
	add_index :locales, [:localetype, :created_at]
  end
end
