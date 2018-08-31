class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :postal
      t.string :category

      t.timestamps
    end

    add_index :organizations, [:name, :postal, :category], unique: true
    add_index :organizations, :category
    add_index :organizations, :state
    add_index :organizations, :postal
  end
end
