
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github_lead_gen/version"

Gem::Specification.new do |spec|
  spec.name          = "github_lead_gen"
  spec.version       = GithubLeadGen::VERSION
  spec.authors       = ["Artur Moczulski"]
  spec.email         = ["artur.moczulski@gmail.com"]

  spec.summary       = %q{Scrape emails from GitHub repositories.}
  spec.homepage      = "https://github.com/ArturMoczulski/github_lead_gen"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency "octokit", "~> 4.0"
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "dotenv"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
end
