class CreateCores < ActiveRecord::Migration
  def self.up
    create_table :cores do |t|
      t.string :descricao, :null => false, :unique => true

      t.timestamps
    end
  end

  def self.down
    drop_table :cores
  end
end
