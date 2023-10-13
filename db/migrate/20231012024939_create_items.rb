class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :label, null: false
      t.references :poll, index: true, null: false

      t.timestamps
    end
  end
end
