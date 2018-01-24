require 'spec_helper'

RSpec.describe JobcoinClient::Requests::Jobcoin do
  let(:jobcoin_client) { described_class.new }
  let(:uri) { URI('http://jobcoin.gemini.com' + path) }
  let(:response) { "[{\"response\":\"OK\"}]" }

  describe '#intialize' do
    subject { jobcoin_client.connection.hostname }

    it 'initializes with the right hostname' do
      expect(subject).to eq('http://jobcoin.gemini.com')
    end
  end

  describe '#transaction_history' do
    subject { jobcoin_client.transaction_history }

    let(:path) { '/protozoan/api/transactions' }

    it 'makes an http call with the correct path' do
      expect(Net::HTTP).to receive(:get).with(uri) { response }
      expect(subject).to eq([{ "response" => "OK" }])
    end
  end

  describe '#address_transactions' do
    subject { jobcoin_client.address_transactions(address) }

    let(:address) { 'Alice' }
    let(:path) { "/protozoan/api/addresses/#{address}" }

    it 'makes an http call with the correct path' do
      expect(Net::HTTP).to receive(:get).with(uri) { response }
      expect(subject).to eq([{ "response" => "OK" }])
    end
  end

  describe '#add_transaction' do
    subject { jobcoin_client.add_transaction(from, to, amount) }

    let(:path) { "/protozoan/api/transactions" }
    let(:from) { 'Alice' }
    let(:to) { 'Bob' }
    let(:amount) { '3' }
    let(:params) do
      {
        'fromAddress' => 'Alice',
        'toAddress' => 'Bob',
        'amount' => '3'
      }
    end
    let(:http_struct) { Struct.new(:body) }
    let(:http_ok) { http_struct.new(response) }

    it 'makes an http call with the correct path' do
      expect(Net::HTTP).to receive(:post_form).with(uri, params) { http_ok }
      expect(subject).to eq([{ "response" => "OK" }])
    end
  end
end
