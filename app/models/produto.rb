class Produto < ApplicationRecord
  has_many :estoques

  validates :nome, presence: true
  validates :preco_venda, presence: true
  validates :preco_venda, numericality: { greater_than: 0, message: "O preço de venda não pode ser menor do que zero!"}
end
