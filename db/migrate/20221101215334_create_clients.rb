class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :age
      t.references :movie, null: true, foreign_key: true

      t.timestamps
    end
  end
end
