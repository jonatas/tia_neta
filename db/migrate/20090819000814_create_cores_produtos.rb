class CreateCoresProdutos < ActiveRecord::Migration
  def self.up
    create_table :cores_produtos, :id => false do |t|
      t.references :cor
      t.references :produto
    end

    add_index "cores_produtos", ["cor_id", "produto_id"], :name => "produto_por_cor", :unique => true
  end

  def self.down
    drop_table :cores_produtos
  end
end
