require 'net/http'

module JobcoinClient
  module Requests
    class Connection
      attr_reader :hostname

      def initialize(hostname)
        # remember that net/http does not want the http part
        @hostname = hostname
      end

      def get(uri)
        Net::HTTP.get(hostname, uri)
      end

      def post(uri, &block)
        Net::HTTP.post_form(uri, block)
      end
    end
  end
end
