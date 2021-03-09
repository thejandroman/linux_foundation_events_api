# frozen_string_literal: true

require_relative 'lib/linux_foundation_events_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'linux_foundation_events_api'
  spec.version       = LinuxFoundationEventsApi::VERSION
  spec.authors       = ['Alejandro Figueroa']
  spec.email         = ['alejandro@ideasftw.com']

  spec.summary       = 'API for https://events.linuxfoundation.org/'
  spec.description   = 'API for https://events.linuxfoundation.org/'
  spec.homepage      = 'https://github.com/thejandroman/linux_foundation_events_api'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/thejandroman/linux_foundation_events_api'
  spec.metadata['changelog_uri'] = 'https://github.com/thejandroman/linux_foundation_events_api/blob/master/changelog.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency 'jbuilder', '~> 2.11'
  spec.add_runtime_dependency 'nokogiri', '~> 1.11'
  spec.add_runtime_dependency 'open-uri', '~> 0.1.0'

  spec.add_development_dependency 'pry', '~> 0.14.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.80'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
