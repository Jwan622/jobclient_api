require 'json'

module JobcoinClient
  module Requests
    class Jobcoin
      attr_reader :connection

      def initialize
        @connection = Connection.new('http://jobcoin.gemini.com')
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
end
