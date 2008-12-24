
def strong_capital_letter(str)
  str.sub(/É|[A-Z]/, '<strong>\0</strong>')
end

def to_id(str)
  str.downcase.gsub(/ /, '-').gsub(/é/, 'e').gsub(/è/, 'e').gsub(/É/, 'e')
end


