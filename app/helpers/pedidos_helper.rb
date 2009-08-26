module PedidosHelper
  def fields_for_pedido_produto(pedido_produto, &block)
    prefix = pedido_produto.new_record? ? 'new' : 'existing'
    fields_for("pedido[#{prefix}_pedido_produto_attributes][]", pedido_produto, &block)
  end

  def add_pedido_produto_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :pedidos_produtos, :partial => 'pedido_produto', :object => PedidoProduto.new
    end 
  end 
end
