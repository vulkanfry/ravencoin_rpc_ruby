# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe RavencoinRpc::Client do
  # rubocop:enable
  let(:url) { '127.0.0.1:8775' }
  let(:password) { 'password' }
  let(:login) { 'login' }
  let(:method) { 'ping1' }
  let(:mock_client_response) { allow(subject).to receive(:send_method!).and_return(->(_method, _args) { nil }) }

  subject { described_class.new(login: login, password: password, url: url) }

  context 'with errors' do
    it 'receive KeyError if get wrong argument number in initialization' do
      expect do
        described_class.new(login: login, password: password)
      end.to raise_error(KeyError)
    end

    it 'receive ArgumentError if get wrong argument number in call method' do
      expect do
        subject.call
      end.to raise_error(ArgumentError)
    end

    it 'receive NotFoundModule if get wrong method name' do
      expect do
        subject.call(method)
      end.to raise_error(RavencoinRpc::Exceptions::NotFoundModule)
    end

    context 'with wrong url' do
      let(:method) { 'ping' }

      it 'receive URI::InvalidURIError' do
        expect do
          subject.call(method)
        end.to raise_error(URI::InvalidURIError)
      end
    end
  end

  context 'valid' do
    let(:method) { 'ping' }
    let(:url) { 'http://127.0.0.1:8775' }

    before do
      mock_client_response
    end

    it 'receive nil using ping method' do
      expect(subject.call(method)).to be nil
    end
  end
end
# rubocop:enable Metrics/BlockLength
