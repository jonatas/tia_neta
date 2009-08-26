class CreatePedidoProdutos < ActiveRecord::Migration
  def self.up
    create_table :pedidos_produtos do |t|
      t.references :pedido
      t.references :produto
      t.references :cor
      t.string :tamanho, :limit => 2
      t.float :quantidade
      t.string :observacao

      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos_produtos
  end
end
