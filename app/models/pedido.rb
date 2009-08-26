class Pedido < ActiveRecord::Base

  has_many :pedidos_produtos, :class_name => 'PedidoProduto', :autosave => true
  validates_associated :pedidos_produtos

  liquid_methods :pedidos_produtos, :data, :cliente, :numero
  
  def data
    created_at.strftime("%d/%m/%y %H:%M")
  end

  def new_pedido_produto_attributes=(atributo_pedido_produto)
    atributo_pedido_produto.each do |pedido_produto|
      next if pedido_produto[:produto_id].blank?
      quantidades_tamanhos = pedido_produto[:quantidade].split(',') 

      quantidades_tamanhos.each do |quantidade_tamanho|
        quantidade, tamanho = quantidade_tamanho.split(" ")
        tamanho ||= pedido_produto[:tamanho]

        atributos = {
             :quantidade => quantidade,
             :cor => Cor.find_or_create_by_descricao(pedido_produto[:cor]),
             :tamanho => tamanho
        }

         self.pedidos_produtos << PedidoProduto.new(pedido_produto.merge(atributos))

      end
     end
  end

  def existing_pedido_produto_attributes=(atributo_pedido_produtos)
    pedidos_produtos.reject(&:new_record?).each do |pedido_produto|
      atributos = atributo_pedido_produtos[pedido_produto.id.to_s]
      if atributos 
        atributos[:cor] = Cor.find_or_create_by_descricao(atributos[:cor])
        pedido_produto.attributes = atributos
      else
        pedido_produto.delete
      end
    end
  end

end
