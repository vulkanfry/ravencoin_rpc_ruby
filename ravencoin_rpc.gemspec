# frozen_string_literal: true

require_relative 'lib/ravencoin_rpc/version'

Gem::Specification.new do |spec|
  spec.name          = 'ravencoin_rpc_ruby'
  spec.version       = RavencoinRpc::VERSION
  spec.authors       = ['Vladimir Sidorenko']
  spec.email         = ['vulkan.u4u1@gmail.com']

  spec.summary       = 'Simple Ravencoin RPC client.'
  spec.homepage      = 'https://github.com/vulkanfry/ravencoin_rpc_ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.4')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/vulkanfry/ravencoin_rpc_ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/vulkanfry/ravencoin_rpc_ruby'

  spec.add_runtime_dependency 'activesupport', '~> 6.1.7'
  spec.add_runtime_dependency 'attr_extras', '~> 6.2'
  spec.add_runtime_dependency 'faraday', '~> 1.3'
  spec.add_runtime_dependency 'faraday_middleware', '~> 1.0'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'ostruct'
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rubocop"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end + %w[docs.json]

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.post_install_message = %(
  -------------------------------------------------
  Thank you for installing ravencoin_rpc!
  You must bundle Filter gem dependencies.
  See ravencoin_rpc README.md for more details.
  https://github.com/vulkanfry/ravencoin_rpc_ruby#dependencies
  -------------------------------------------------
  )
end
