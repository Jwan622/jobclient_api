require 'net/http'

class Connection
  attr_reader :hostname

  def initialize(hostname)
    # remember that net/http does not want the http part
    @hostname = hostname
  end

  def get(uri)
    Net::HTTP.get(hostname, uri)
  end
end
