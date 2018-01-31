# JobcoinClient

A library for interacting with the Jobcoin API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jobcoin_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jobcoin_client

You also need to require the `jobcoin_client` library in your app like this:

```
require 'jobcoin_client'
```

## Usage

Three ways to use the gem:

1.
```ruby
JobcoinClient::Jobcoin.new.transaction_history
```

returns the history all transactions:

```
JobcoinClient::Jobcoin.new.transaction_history
=> [{"timestamp"=>"2018-01-18T02:57:34.959Z", "toAddress"=>"Alice", "amount"=>"50"}, {"timestamp"=>"2018-01-18T02:57:35.016Z", "fromAddress"=>"Alice", "toAddress"=>"Bob", "amount"=>"12.5"}, {"timestamp"=>"2018-01-18T16:53:16.747Z", "toAddress"=>"50", "amount"=>"50"}, {"timestamp"=>"2018-01-18T16:53:27.572Z", "fromAddress"=>"50", "toAddress"=>"alice", "amount"=>"50"}, {"timestamp"=>"2018-01-18T16:53:38.853Z", "fromAddress"=>"alice", "toAddress"=>"Alice", "amount"=>"50"}, {"timestamp"=>"2018-01-23T23:35:03.792Z", "fromAddress"=>"Alice", "toAddress"=>"alice", "amount"=>"10"}, {"timestamp"=>"2018-01-23T23:35:25.464Z", "fromAddress"=>"Alice", "toAddress"=>"Bob", "amount"=>"1"},
```

2.
```ruby
JobcoinClient::Jobcoin.new.add_transaction(addressFrom, addressTo, amount)
```

Will send `amount` Jobcoin to the `addressTo` from the `addressFrom`

3.
```ruby
JobcoinClient::Jobcoin.new.address_transactions(<someAddressGoesHere>)
```

Will return this:
```
=> {"balance"=>"0.00", "transactions"=>[{"timestamp"=>"2018-01-31T21:34:52.166Z", "fromAddress"=>"52c7ec3135687308f6c2f1cb6d4ecb56a10a96173f10865e6ab212fa6beed273dea64cc2b2253cee4991e836120d", "toAddress"=>"thisIsTheHouseAccount1", "amount"=>"0.2"}, {"timestamp"=>"2018-01-31T21:35:06.903Z", "fromAddress"=>"thisIsTheHouseAccount1", "toAddress"=>"address50", "amount"=>"0.1"}, {"timestamp"=>"2018-01-31T21:35:08.629Z", "fromAddress"=>"thisIsTheHouseAccount1", "toAddress"=>"address51", "amount"=>"0.1"},
```

The above contains 'balance' and 'transactions' data. The transactions data contains all the transactions
that the specified address was the sender and the receiver.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwan622/jobcoin_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JobcoinClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jobcoin_client/blob/master/CODE_OF_CONDUCT.md).
