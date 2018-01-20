require 'json'

module JobcoinClient
  module Requests
    class Jobcoin
      attr_reader :connection

      def initialize
        @connection = Connection.new('jobcoin.gemini.com')
      end

      def transaction_history
        JSON.parse(connection.get('/protozoan/api/transactions'))
      end

      def address_transactions(address)
        JSON.parse(connection.get("/protozoan/api/addresses/#{address}"))
      end

      def add_transaction(from, to, amount)
        header = { 'Content-Type' => 'text/json' }
        payload = {
          from: from,
          to: to,
          amount: amount
        }

        JSON.parse(connection.post("protozoan/api/transactions")) do
          payload
        end
      end
    end
  end
end
