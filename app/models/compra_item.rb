class CompraItem < ApplicationRecord
  belongs_to :compra, inverse_of: :compra_itens
  belongs_to :produto

  validates :produto_id, presence: true
  accepts_nested_attributes_for :compra, allow_destroy: true
  validates :quantidade, :valor_total, numericality: { greater_than: 0 }

  before_validation :calcula_valor_total
  before_create :encontra_ou_cria_estoque
  after_destroy :recalcula_ao_excluir

  # adicionar validação para que o campo COMPETENCIA (data_entrada) não possa ser colocado para o mês seguinte.
  # a compra deve ser com a data_entrada apenas com o mês atual.
  #
  # por que? fiz testes com datas maiores e, logicamente, o estoque não atualiza caso eu faça compras no mes atual
  # e existam compras com algum mês posterior, por exemplo, possuo já uma compra no mês 03/2024 e vou fazer outra
  # compra no mês 02/2024, o estoque não irá atualizar pois a data da competencia é superior a data atual.

  def calcula_valor_total
    self.valor_total = self.valor_unitario * self.quantidade
  end

  def encontra_ou_cria_estoque
    estoque = Estoque.find_or_initialize_by(
      produto_id: self.produto_id,
      competencia: self.compra.data_entrada.strftime("%Y%m")
    )
    if estoque.new_record?
      estoque.competencia = self.compra.data_entrada.strftime("%Y%m")
      estoque.qtde_entrada = self.set_saldo_inicial + self.quantidade
      estoque.qtde_saida = 0
    else
      estoque.qtde_entrada = self.quantidade
      estoque.qtde_estoque = self.atualiza_estoque(estoque)
    end
    estoque.save!
    atualiza_estoque(estoque)
  end

  # pesquisar como faz o saldo do mês passado para diferenciar do saldo do estoque do mês atual
  def set_saldo_inicial
    ultimo_saldo = Estoque.where(produto_id: self.produto_id).where.not(id: self.id).last#(competencia: self.compra.data_entrada.strftime("%Y%m")).last
    return ultimo_saldo.blank? ? 0 : ultimo_saldo.qtde_estoque
  end

  def atualiza_estoque(estoque)
    estoque.qtde_estoque = estoque.qtde_entrada - estoque.qtde_saida
    estoque.save!
  end

   def recalcula_ao_excluir
    estoque = Estoque.find_or_initialize_by(
      produto_id: self.produto_id,
      competencia: self.compra.data_entrada.strftime("%Y%m")
    )
    estoque.qtde_entrada -= self.quantidade
    estoque.save!
    atualiza_estoque(estoque)
   end

end
