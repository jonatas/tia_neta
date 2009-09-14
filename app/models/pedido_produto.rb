class PedidoProduto < ActiveRecord::Base

  belongs_to :produto
  belongs_to :pedido
  belongs_to :cor

  validates_associated :produto, :allow_nil => false , :message => "não encontrado"
  validates_associated :cor, :allow_nil => true
  validates_numericality_of :quantidade
  validates_presence_of :produto

  def before_save
    self.tamanho = self.tamanho.upcase
   end

  def quantidade
    super.to_i
  end

  def to_s
    "#{quantidade} ref: #{produto.id}(#{tamanho})- cor: #{cor}"
  end
  

end
