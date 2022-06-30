# -*- encoding: utf-8 -*-
# stub: eth 0.4.17 ruby lib

Gem::Specification.new do |s|
  s.name = "eth".freeze
  s.version = "0.4.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/se3000/ruby-eth/issues", "github_repo" => "https://github.com/se3000/ruby-eth", "homepage_uri" => "https://github.com/se3000/ruby-eth", "source_code_uri" => "https://github.com/se3000/ruby-eth" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steve Ellis".freeze, "Afri Schoedon".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-12-01"
  s.description = "Library to build, parse, and sign Ethereum transactions.".freeze
  s.email = ["email@steveell.is".freeze, "ruby@q9f.cc".freeze]
  s.homepage = "https://github.com/se3000/ruby-eth".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.2".freeze, "< 4.0".freeze])
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Simple API to sign Ethereum transactions.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<keccak>.freeze, ["~> 1.3"])
    s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.15"])
    s.add_runtime_dependency(%q<money-tree>.freeze, ["~> 0.10"])
    s.add_runtime_dependency(%q<rlp>.freeze, ["~> 0.7"])
    s.add_runtime_dependency(%q<scrypt>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.2"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.14"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.10"])
  else
    s.add_dependency(%q<keccak>.freeze, ["~> 1.3"])
    s.add_dependency(%q<ffi>.freeze, ["~> 1.15"])
    s.add_dependency(%q<money-tree>.freeze, ["~> 0.10"])
    s.add_dependency(%q<rlp>.freeze, ["~> 0.7"])
    s.add_dependency(%q<scrypt>.freeze, ["~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.2"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.10"])
  end
end
