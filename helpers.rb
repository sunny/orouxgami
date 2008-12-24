require 'net/smtp'

def strong_capital_letter(str)
  str.sub(/É|[A-Z]/, '<strong>\0</strong>')
end

def to_id(str)
  str.downcase.gsub(/ /, '-').gsub(/é/, 'e').gsub(/è/, 'e').gsub(/É/, 'e')
end

def link_to(link, text = nil)
  text = link.gsub(/^.*:\/\/(www\.)?/, '') if text.nil?
  "<a href=\"#{link}\">#{text}</a>"
end

def send_us_email(to, subject, message)

msg = <<END_OF_MESSAGE
From: #{from_alias} <#{from}>
To: #{to_alias} <#{to}>
Subject: #{subject}

#{message}
END_OF_MESSAGE

  Net::SMTP.start('localhost') do |smtp|
    smtp.send_message msg, from, to
  end

end

def send_email(options)
msg = <<END_OF_MESSAGE
From: #{options[:from]}
To: #{options[:to]}
Subject: #{options[:subject]}

#{options[:message]}
END_OF_MESSAGE

  Net::SMTP.start('localhost') do |smtp|
    smtp.send_message msg, options[:from], options[:to]
  end
end

