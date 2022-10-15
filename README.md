[![Gem Version](https://badge.fury.io/rb/ravencoin_rpc_ruby.svg)](https://badge.fury.io/rb/ravencoin_rpc_ruby)

# RavencoinRpcRuby

A package that will help you do RPC calls from Ruby / Rails / etc to your Raven core node.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ravencoin_rpc'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ravencoin_rpc

## Usage

```ruby
@client ||= RavencoinRpc::Client.new(url: 'raven_node_rpc_url:port', login: 'login', password: 'password')

# Get difficulty

client.('getdifficulty')
=> 235605.3157608159

# Get getbestblockhash

client.('getbestblockhash')
=> "0000000000000c8df13031bd90c0ede26d7a1439fc955e001028bab4f6449f1b"

# Get getassetdata

client.('getassetdata', ['SYNTH/COIN'])
=> {"name"=>"SYNTH/COIN", "amount"=>21000000, "units"=>0, "reissuable"=>1, "has_ipfs"=>1, "ipfs_hash"=>"QmQNeN1mNWFJXg37Vq48CkVhLsva84uHYBkBdCA7ELEaYv"}

# Get getrawtransaction

client.('getrawtransaction', ['735e678c50f12d5ca49866a7a72652448c5663efabc280017c26ab9bfedff190', true])

=> {"txid"=>"735e678c50f12d5ca49866a7a72652448c5663efabc280017c26ab9bfedff190", "hash"=>"26bde081606193f60ef2ecbdc12c6178e509359f6587bd1d0c73698dd9632feb", "version"=>1, "size"=>186, "vsize"=>159, "locktime"=>0, "vin"=>[{"coinbase"=>"03211626002f666c79706f6f6c2e6f72672f", "sequence"=>4294967295}], "vout"=>[{"value"=>2500.01569097, "n"=>0, "scriptPubKey"=>{"asm"=>"OP_DUP OP_HASH160 cb6d3fedc3b50d5936a36601710c6008ff783fd1 OP_EQUALVERIFY OP_CHECKSIG", "hex"=>"76a914cb6d3fedc3b50d5936a36601710c6008ff783fd188ac", "reqSigs"=>1, "type"=>"pubkeyhash", "addresses"=>["RTpp8G7Y5f9HZ1iGNz1gtbWazwnHvoHCxK"]}, "valueSat"=>250001569097}, {"value"=>0.0, "n"=>1, "scriptPubKey"=>{"asm"=>"OP_RETURN aa21a9ede7b473ed902c0f0dbf40ad15b44415efd01b33031c9aa3ad22a7270300a5b614", "hex"=>"6a24aa21a9ede7b473ed902c0f0dbf40ad15b44415efd01b33031c9aa3ad22a7270300a5b614", "type"=>"nulldata"}, "valueSat"=>0}], "hex"=>"010000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff1203211626002f666c79706f6f6c2e6f72672fffffffff02493541353a0000001976a914cb6d3fedc3b50d5936a36601710c6008ff783fd188ac0000000000000000266a24aa21a9ede7b473ed902c0f0dbf40ad15b44415efd01b33031c9aa3ad22a7270300a5b6140120000000000000000000000000000000000000000000000000000000000000000000000000", "blockhash"=>"00000000000041dbecb93a3a577816dce9321053f75429a9497d5003677af7eb", "height"=>2496033, "confirmations"=>2, "time"=>1665821398, "blocktime"=>1665821398}
```

## [See all methods](ravencoin_methods.md)



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vulkanfry/ravencoin_rpc_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/vulkanfry/ravencoin_rpc_ruby/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
