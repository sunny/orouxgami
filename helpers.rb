def strong_capital_letter(str)
  str.sub(/É|[A-Z]/, '<strong>\0</strong>')
end
