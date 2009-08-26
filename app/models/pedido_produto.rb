class PedidoProduto < ActiveRecord::Base

  belongs_to :produto
  belongs_to :pedido
  belongs_to :cor
  liquid_methods :cor, :pedido, :produto, :quantidade

  validates_associated :produto, :allow_nil => false , :message => "não encontrado"
  validates_associated :cor, :allow_nil => true
  validates_numericality_of :quantidade
  validates_presence_of :produto

  def to_s
    "#{quantidade} ref: #{produto.id}(#{tamanho})- cor: #{cor}"
  end
  

end
