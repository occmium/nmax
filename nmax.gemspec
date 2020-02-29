lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nmax/version"

Gem::Specification.new do |spec|
  spec.authors       = ["occmium"]
  spec.files         = Dir["lib/**/*.rb"]
  spec.name          = "nmax"
  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.version       = Nmax::VERSION

  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/occmium/nmax"
  spec.email         = ["occkart@yahoo.com"]
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/occmium/nmax"

  spec.bindir        = "bin"
  spec.executables   = "nmax"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "get_process_mem"
end
