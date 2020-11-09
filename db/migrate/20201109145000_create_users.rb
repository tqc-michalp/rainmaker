class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    # add_index :users, :first_name
    # add_index :users, :last_name
    # add_index :users, %[first_name last_name], using: :gin
  end
end
