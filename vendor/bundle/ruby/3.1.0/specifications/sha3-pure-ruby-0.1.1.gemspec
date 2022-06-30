# -*- encoding: utf-8 -*-
# stub: sha3-pure-ruby 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "sha3-pure-ruby".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["havenwood".freeze]
  s.date = "2013-03-21"
  s.description = "An implementation of SHA3 in pure Ruby.".freeze
  s.email = ["shannonskipper@gmail.com".freeze]
  s.homepage = "https://github.com/havenwood/sha3-pure-ruby".freeze
  s.licenses = ["https://creativecommons.org/publicdomain/zero/1.0/".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Pure Ruby SHA3.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end
