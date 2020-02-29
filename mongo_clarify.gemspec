# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_clarify/version'

Gem::Specification.new do |spec|
  spec.name          = 'mongo_clarify'
  spec.version       = MongoClarify::VERSION
  spec.authors       = ['morihirok']
  spec.email         = ['omnimani3@gmail.com']

  spec.summary       = "Make MongoDB's explain results more understandable."
  spec.homepage      = 'https://github.com/morihirok/mongo-clarify'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pattern-match'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
