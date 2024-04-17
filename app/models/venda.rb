class Venda < ApplicationRecord
  belongs_to :cliente, optional: true

  has_many :venda_itens, dependent: :destroy, inverse_of: :venda
  accepts_nested_attributes_for :venda_itens, reject_if: :all_blank, allow_destroy: true
  has_many :produtos, through: :venda_itens
  has_many :titulos_receber, dependent: :destroy
  validates :data_saida, :cliente_id, presence: true

  before_create :define_valores
  before_create :precisa_parcelar

  def define_valores
    self.valor_total = venda_itens.map(&:valor_total).sum
    self.valor_a_prazo = self.valor_total - self.valor_a_vista
  end

  def precisa_parcelar
    if self.valor_a_vista == self.valor_total
      venda_quitada()
    else
      gera_titulo_a_receber()
    end
  end

  def gera_titulo_a_receber
    parcelamento_service = ParcelamentoService.new(self)
    parcelamento_service.parcelamento
  end

  def venda_quitada
    self.status = 'Essa venda está quitada!'
  end
end
