class ParcelamentoService

  attr_accessor :movimentacao

  # verificar se é venda ou se é compra
  # class_name

  def initialize(movimentacao)
    self.movimentacao = movimentacao
  end

  def parcelamento
    dias_entre_parcelas = self.movimentacao.dias_intervalo
    valor_da_parcela = self.movimentacao.valor_a_prazo / self.movimentacao.numero_de_parcelas


    if movimentacao.class.name == "Venda"
      self.movimentacao.numero_de_parcelas.times do |index|
        self.movimentacao.titulos_receber.build(
          numero_parcela: (index + 1),
          data_vencimento: self.movimentacao.data_saida + dias_entre_parcelas.days,
          valor_parcela: valor_da_parcela
        )
        dias_entre_parcelas += self.movimentacao.dias_intervalo
      end
    end

    if movimentacao.class.name == "Compra"
      self.movimentacao.numero_de_parcelas.times do |index|
        self.movimentacao.titulos_pagar.build(
          numero_parcela: (index + 1),
          data_vencimento: self.movimentacao.data_entrada + dias_entre_parcelas.days,
          valor_parcela: valor_da_parcela
        )
        dias_entre_parcelas += self.movimentacao.dias_intervalo
      end
    end
  end

end
