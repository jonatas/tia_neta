module ProdutosHelper
  def fields_for_cor(cor, &block)
    prefix = cor.new_record? ? 'new' : 'existing'
    fields_for("produto[#{prefix}_cor_attributes][]", cor, &block)
end

def add_cor_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :cores, :partial => 'cor', :object => Cor.new 
    end 
end 
end
