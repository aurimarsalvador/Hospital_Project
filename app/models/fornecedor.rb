class Fornecedor < ApplicationRecord
  has_many :compras

  validates :nome, presence: true
  validates :cpf_cnpj, length: {minimum:11, maximum:14}
  validates :cpf_cnpj, presence: true
  validates :cpf_cnpj, uniqueness: true
end
