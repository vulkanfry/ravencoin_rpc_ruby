# frozen_string_literal: true

RSpec.describe RavencoinRpc do
  it 'has a version number' do
    expect(RavencoinRpc::VERSION).not_to be nil
  end
end
