class Produto < ActiveRecord::Base

  has_and_belongs_to_many :cores, :uniq => true
  validates_associated :cores

  def new_cor_attributes=(atributo_cores)
    atributo_cores.each do |cor|
      cores << Cor.find_or_create_by_descricao(cor[:descricao]) if not cor[:descricao].blank?
    end
  end

  def existing_cor_attributes=(atributo_cores)
    cores.reject(&:new_record?).each do |cor|
      atributos = atributo_cores[cor.id.to_s]
      if atributos
        cor.attributes = atributos
      else
        cor.delete
      end
    end
  end
  def to_s
    [id, descricao].join(" : ")
  end
end
 
