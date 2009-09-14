class RelatoriosController < ApplicationController
  def index 
    if not params[:data_final] and not params[:data_final]
      params[:data_inicial] = Date.today - 7
      params[:data_final] = Date.today + 1

    else 
      where  =  {:created_at => params[:data_inicial].split("/").reverse.join("-")..params[:data_final].split("/").reverse.join("-")}

      if not params[:produto_id].blank?
        where["pedidos_produtos.produto_id"] = params[:produto_id].split(",").collect{|e|e.to_i}
      end
      if not params[:cliente].blank?
        where["pedidos.cliente"] = params[:cliente]
      end
      @pedidos_produtos = PedidoProduto.all(:conditions => where,
                                          :include => :pedido)

      case params[:commit] 
      when "Exibir Relatório de Pedidos Agrupado por Produto, Cor e Tamanho" : render :template => 'relatorios/pedidos_agrupados_por_produto_cor_tamanho_complemento'
      when "Exibir Relatório de Pedidos Que o Produto Pertence" : render :template => 'relatorios/produto_com_pedidos_relacionados'
      end
    end
    
  end

end
