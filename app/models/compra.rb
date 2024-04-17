class Compra < ApplicationRecord
  belongs_to :fornecedor, optional: true

  has_many :compra_itens, dependent: :destroy, inverse_of: :compra
  accepts_nested_attributes_for :compra_itens, reject_if: :all_blank, allow_destroy: true
  has_many :produtos, through: :compra_itens
  has_many :titulos_pagar, dependent: :destroy
  validates :data_entrada, :fornecedor_id, presence: true

  before_create :define_valores
  before_create :precisa_parcelar

  def define_valores
    self.valor_total = compra_itens.map(&:valor_total).sum
    self.valor_a_prazo = self.valor_total - self.valor_a_vista
  end

  def precisa_parcelar
    if self.valor_a_vista == self.valor_total
      compra_quitada()
    else
      gera_titulo_a_pagar()
    end
  end

  def gera_titulo_a_pagar
    parcelamento_service = ParcelamentoService.new(self)
    parcelamento_service.parcelamento
  end

  def compra_quitada
    self.status = 'Essa compra está quitada!'
  end
end
