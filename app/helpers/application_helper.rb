module ApplicationHelper


  def number_to_currency_br(number)
    number_to_currency(number, :unit => "Rp ", :separator => ",", :delimiter => ".")
  end


end
