# -*- encoding: utf-8 -*-
# stub: rlp 0.7.3 ruby lib

Gem::Specification.new do |s|
  s.name = "rlp".freeze
  s.version = "0.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jan Xie".freeze]
  s.date = "2016-06-16"
  s.description = "A Ruby implementation of Ethereum's Recursive Length Prefix encoding (RLP).".freeze
  s.email = ["jan.h.xie@gmail.com".freeze]
  s.homepage = "https://github.com/janx/ruby-rlp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "The ruby RLP serialization library.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.5"])
    s.add_development_dependency(%q<minitest>.freeze, ["= 5.8.3"])
    s.add_development_dependency(%q<yard>.freeze, ["= 0.8.7.6"])
  else
    s.add_dependency(%q<rake>.freeze, ["~> 10.5"])
    s.add_dependency(%q<minitest>.freeze, ["= 5.8.3"])
    s.add_dependency(%q<yard>.freeze, ["= 0.8.7.6"])
  end
end
