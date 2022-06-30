# -*- encoding: utf-8 -*-
# stub: money-tree 0.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "money-tree".freeze
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Micah Winkelspecht".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEHDCCAoSgAwIBAgIBATANBgkqhkiG9w0BAQsFADAcMRowGAYDVQQDDBFtYXR0\nL0RDPWdlbS9EQz1jbzAeFw0xODA1MzAyMTQwNDZaFw0xOTA1MzAyMTQwNDZaMBwx\nGjAYBgNVBAMMEW1hdHQvREM9Z2VtL0RDPWNvMIIBojANBgkqhkiG9w0BAQEFAAOC\nAY8AMIIBigKCAYEAxfbjMHFlxA2P+4YWPagKoGAMi4078imgXdFbD3Rloe6cGfYp\nIMUQitiHrKi6fhSE0UjXmoP3qnYFddm1enN9zUAFRhHWv7xpINqSqss4PYAb5Anl\nRYZu3jromop5aVodi15HUfu5z27MvBm4rAaN/dDRfh/rT2hDbTTh0HmvEaPUDfX6\nTyflAttfabFvtY4qsD+ao8tks0DytqyuEWZ0tvQ6upOgHRNNuYDwDZB1T9v2dq2w\n3goJFmOKBMMn7UH8WMjD3HiOuRD4tWhq5xWLjBqjzFlVPlZPgdCNyXeMMnLXER98\nNY35cVWFFuqG+kZwy4MFKdE9WFTocLZxLFo0VVTNSpPara9HirbHtIo9jZNuop4S\ng4JTf1F8dIWYii3sXoAYZfkl6rHVRP0G/OV5LcTfSS3QkmI5hNltz5FZzc+qI6S1\nrTR1ZwTy1rRI3coFY7vDRaFWBoMbbo/DytgCE3+rfbVDxQrJa4aZ0iYDhu8LXEA1\nVTtpf1EWYCOsYE1TAgMBAAGjaTBnMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0G\nA1UdDgQWBBQ6QoDNre7LFgOukH2Cv+RqZyfUzjAWBgNVHREEDzANgQttYXR0QGdl\nbS5jbzAWBgNVHRIEDzANgQttYXR0QGdlbS5jbzANBgkqhkiG9w0BAQsFAAOCAYEA\nkOxYnOsB+NwHwLc2lHEZ8ubxanq2qIZDhvVQ4M31gwmba43xO7vq0ktFxYRvozs4\n74dQ6bmY2e7njoFgeutyJwxulA+BC71mDQA1s4WsZo7Z2TRgB0GViVqHrzq+jY+M\np9mTHQqKH+2j0P9T4DXSzq4qOaBA3YROAwAzYI9N8MObeWkRt2pZ4zYQrAniP2nd\nwzXs/G5lWbbntVcvQOfAAXBipSJ3X5P2EGpUytP9ZpGdezY5HZzuiJFcmCf1CM3t\nVX4NZjbJak9gOY0AFD0Aw497sYenm0VBExclOmeRuZLffpWteTTL//utpG3bbFPl\njQ78uzsrexYTYW5IshjfSIf3TZxm50Z45pyOTow5EOP1Nd7OmKOcI8hrLGv5+AlD\nhCnomUTUNsM4Rjwl5rzQiIn3ezv6+0tlg4rWJmVTuOGwcHk/oj1In2sPjCqm0pgx\nTLnMa8gr6aUpuHR5s2N4ZH0Q2YIsaD6cv7DYXt+G4MRut3njOYHfkqsSVykO6hvr\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-05-30"
  s.description = "A Ruby Gem implementation of Bitcoin HD Wallets".freeze
  s.email = ["winkelspecht@gmail.com".freeze]
  s.homepage = "https://github.com/gemhq/money-tree".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Bitcoin Hierarchical Deterministic Wallets in Ruby! (Bitcoin standard BIP0032)".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ffi>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  else
    s.add_dependency(%q<ffi>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
