# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sifter/version"

Gem::Specification.new do |s|
  s.name        = "sifter"
  s.version     = Sifter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adam Keys"]
  s.email       = ["adam@nextupdate.com"]
  s.homepage    = "http://github.com/nextupdate/sifter-ruby"
  s.summary     = %q{Wrapper for the Sifter API}
  s.description = %q{Query, fetch, create and modify issues stored in Sifter.}

  s.rubyforge_project = "sifter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'httparty', '~> 0.13.0'
  s.add_dependency 'hashie', '~> 2.0.5'
end
