class CreateMetals < ActiveRecord::Migration
  def change
    create_table :metals do |t|
      t.string      :name, :null => false
      t.timestamps
    end
  end
end
