class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :project_name
      t.string :industry
      t.string :description
      t.string :instrument
      t.integer :years
      t.float :return
      t.integer :required_funding
      t.integer :entrepreneur_id

      t.timestamps
    end
  end
end
