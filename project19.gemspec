# frozen_string_literal: true

require_relative "lib/project19/version"

Gem::Specification.new do |spec|
  spec.name          = "project19"
  spec.version       = Project19::VERSION
  spec.authors       = ["prasannaboga"]
  spec.email         = ["prasannaboga@gmail.com"]

  spec.summary       = "My Sample ruby project"
  spec.description   = "Testing sintra and sidekiq in AWS ECS"
  spec.homepage      = "https://github.com/prasannaboga/project19"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = "https://github.com/prasannaboga/project19"
  spec.metadata["source_code_uri"] = "https://github.com/prasannaboga/project19"
  spec.metadata["changelog_uri"] = "https://github.com/prasannaboga/project19"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
