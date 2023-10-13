class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :item, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
