class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :name, :null => false
      t.float  :melt_weight, :null => false
      t.references :metal, :null => false
      t.timestamps
    end
  end
end
