class CreateEntrepreneurs < ActiveRecord::Migration[6.0]
  def change
    create_table :entrepreneurs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :mobile

      t.timestamps
    end
  end
end
