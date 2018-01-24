require 'net/http'

module JobcoinClient
  module Requests
    class Connection
      attr_reader :hostname

      def initialize(hostname)
        @hostname = hostname
      end

      def get(path)
        uri = build_uri(path)

        Net::HTTP.get(uri)
      end

      def post(path, params)
        uri = build_uri(path)

        Net::HTTP.post_form(uri, params)
      end

      private

      def build_uri(path)
        URI(hostname + path)
      end
    end
  end
end
