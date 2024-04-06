# frozen_string_literal: true

require_relative "lib/code_snippet_manager/version"

Gem::Specification.new do |spec|
  spec.name = "code_snippet_manager"
  spec.version = CodeSnippetManager::VERSION
  spec.authors = ["jovan-sremacki"]
  spec.email = ["jovansr@protonmail.com"]

  spec.summary = %q{Efficient management and retrieval of code snippets.}
  spec.description = %q{A Ruby gem to help developers store, organize, categorize, and quickly retrieve code snippets, enhancing productivity and promoting code reuse.}
  spec.homepage = "https://github.com/jovan-sremacki/code_snippet_manager"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jovan-sremacki/code_snippet_manager"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependency
  spec.add_runtime_dependency "tty-prompt", "~> 0.23.0"
  spec.add_runtime_dependency ""

  # Development dependencies
  spec.add_development_dependency "rspec", "~> 3.10"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
