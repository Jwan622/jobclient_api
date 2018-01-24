require 'spec_helper'

RSpec.describe JobcoinClient::Requests::Connection do
  let(:connection) { described_class.new(hostname) }
  let(:hostname) { 'http://hostname.com' }
  let(:path) { '/some/path' }
  let(:uri) { URI(hostname + path) }

  describe '#get' do
    subject { connection.get(path) }

    it 'makes a get call via net/http' do
      expect(Net::HTTP).to receive(:get).with(uri)

      subject
    end
  end

  describe '#post' do
    subject { connection.post(path, params) }

    let(:params) do
      { argument_one: "some value",
        argument_two: "some other value"
      }
    end

    it 'makes a post call with params via net/http' do
      expect(Net::HTTP).to receive(:post_form).with(uri, params)

      subject
    end
  end
end
