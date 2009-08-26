class RelatoriosController < ApplicationController
  def pedidos_produtos
    params[:data_inicial] ||= Date.today - 7
    params[:data_final] ||= Date.today + 1
    where  =  {:created_at => params[:data_inicial]..params[:data_final]}
    if params[:produto_id]
      where[:produto_id] = params[:produto_id].split(",")
    end
    @pedidos_produtos = PedidoProduto.all(:conditions => where,
                                             :include => :pedido).group_by{|p|p.produto}
    
  end


end
