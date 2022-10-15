# frozen_string_literal: true

require 'attr_extras'
require 'json'

# This class create docs from docs.json
class CreateDocs
  pattr_initialize %i[]

  def call
    [ravencoin_methods]
  end

  private

  def docs
    @docs ||= JSON.parse(File.open('docs.json').read)
  end

  def ravencoin_methods
    File.open('ravencoin_methods.md', 'w') do |entry|
      entry << '# Ravencoin remote procedure calls / methods'
      entry << "\r\n#[Home](README.md)"
      with_method do |key|
        entry << "\r\n## #{key} \r\n"
        entry << docs[key]
      end
    end
  end

  def with_method
    docs.each_key do |key|
      next unless key

      yield key
    end
  end
end
