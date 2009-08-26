class CreateCorPedidoProdutos < ActiveRecord::Migration
  def self.up
    create_table :cores_pedido_produtos do |t|
      t.references :pedido_produto
      t.references :cor
    end

    add_index "cores_pedido_produtos", ["pedido_produto_id"], :name => "pedido_produto"
  end

  def self.down
    drop_table :cores_pedido_produtos
  end
end
