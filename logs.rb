require 'librato/metrics'

##
# Parses formatted metrics out of a single log line.
#
# line - A line of rfc5424 formatted data.
#
# Examples
#
#   message = Message.new('74 <174>1 2012-07-22T00:06:26+00:00 source=app measure.something=10s')
#
#   message.source
#   # => 'app'
#
#   message.metric
#   # => 'measure.something'
#
#   message.value
#   # => 10
#
#   message.units
#   # => 's'
class Message < Struct.new(:line)
  def formatted?
  end

  def source
  end

  def metric
  end

  def value
  end

  def units
  end
end

puts payload