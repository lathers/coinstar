class CreateOwnedCoins < ActiveRecord::Migration
  def change
    create_table :owned_coins do |t|
      t.references :user
      t.references :coin
      t.timestamps
    end
  end
end
