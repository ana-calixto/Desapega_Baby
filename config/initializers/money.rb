# encoding : utf-8

MoneyRails.configure do |config|

  Money.locale_backend = :currency

  MoneyRails.configure do |config|
    config.default_currency = :brl  #checar se é mesmo BRL o nome da moeda
  end
end
