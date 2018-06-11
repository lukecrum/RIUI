
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "RIUI/version"

Gem::Specification.new do |spec|
  spec.name          = "RIUI"
  spec.version       = RIUI::VERSION
  spec.authors       = ["lukecrum20"]
  spec.email         = ["lukecrum20@gmail.com"]

  spec.summary       = "A simple user interface framework for Ruby"
  spec.homepage      = "https://github.com/lukecrum/RIUI"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "ruby2d", "~> 0.5.1"
end
