require 'net/http'

class Connection
  attr_reader :hostname

  def initialize(hostname)
    @hostname = hostname
  end

  def get(uri)
    Net::HTTP.get(hostname, '/protozoan/api/transactions')
  end
end
