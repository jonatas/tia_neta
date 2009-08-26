class Cor < ActiveRecord::Base
  validates_uniqueness_of :descricao
  validates_presence_of :descricao, :case_sensitive => false

  has_and_belongs_to_many :produtos
  def to_s
    descricao
  end
end
