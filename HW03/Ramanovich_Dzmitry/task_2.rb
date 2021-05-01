# frozen_string_literal: true

DATA = /(?<=\[)[^]]+(?=\])/.freeze
FROM = /^[0-9]+\.+[0-9]+\.+[0-9]+\.+[0-9]*/.freeze
TO = /POST (.*) HTTP/.freeze

def task2(example)
  array = []
  lines = example.split("\n")
  lines.each do |str|
    data = str.scan(DATA).first
    next if data.nil?

    from = str.scan(FROM).first
    to = str.scan(TO).first

    array << "DATE: #{data} FROM: #{from} TO: #{to}"
  end
  array
end

puts task2('10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
    10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
    2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290')
