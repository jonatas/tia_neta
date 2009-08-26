class CreatePedidos < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.integer :numero, :limit => 8
      t.string :cliente
      t.text :observacao

      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos
  end
end
