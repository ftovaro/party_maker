class CreatePolls < ActiveRecord::Migration[7.1]
  def change
    create_table :polls do |t|
      t.integer :status, null: false, default: 0
      t.string :name, null: false
      t.references :party
      t.timestamps
    end
  end
end
