require "jobcoin_client/version"
Dir["./lib/jobcoin_client/requests/*.rb"].each {|file| require file }

# one way to use pry only in development mode. In prod, this will raise a LoadError
begin
  require 'pry'
rescue LoadError => err
  puts err
end

module JobcoinClient
end
