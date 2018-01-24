lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jobcoin_client/version"

Gem::Specification.new do |spec|
  spec.name          = "jobcoin_client"
  spec.version       = JobcoinClient::VERSION
  spec.authors       = ["Jeffrey"]
  spec.email         = ["jwan622@gmail.com"]

  spec.summary       = %q{Client for the Jobcoin API from Gemini.}
  spec.description   = %q{In the event that other people want reuse this client for the JobCoin API, they can!}
  spec.homepage      = %q{https://github.com/Jwan622/jobclient_api}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency "pry", "~> 0.11"
end
