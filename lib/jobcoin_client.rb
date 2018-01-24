require "jobcoin_client/version"
require 'json'
Dir["./lib/jobcoin_client/requests/*.rb"].each {|file| require file }

# one way to use pry only in development mode. In prod, this will raise a LoadError
begin
  require 'pry'
rescue LoadError => err
  puts err
end

module JobcoinClient
  class Jobcoin
    attr_reader :connection

    def initialize
      @connection = ::JobcoinClient::Requests::Connection.new('http://jobcoin.gemini.com')
    end

    def transaction_history
      res = connection.get('/protozoan/api/transactions')

      JSON.parse(res)
    end

    def address_transactions(address)
      res = connection.get("/protozoan/api/addresses/#{address}")

      JSON.parse(res)
    end

    def add_transaction(from, to, amount)
      payload = {
        'fromAddress' => from,
        'toAddress' => to,
        'amount' => amount
      }

      res = connection.post("/protozoan/api/transactions", payload)
      JSON.parse(res.body)
    end
  end
end
