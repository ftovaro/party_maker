class CreateParties < ActiveRecord::Migration[7.1]
  def change
    create_table :parties do |t|
      t.timestamp :date, null: false

      t.timestamps
    end
  end
end
