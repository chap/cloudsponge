# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cloudsponge/version"

Gem::Specification.new do |s|
  s.name        = "cloudsponge"
  s.version     = Cloudsponge::VERSION
  s.authors     = ["Graeme Rouse", "Ellis Berner"]
  s.email       = ["chapambrose@gmail.com"]
  s.homepage    = "https://github.com/chap/cloudsponge"
  s.summary     = %q{Wrapper for cloudsponge.com, forked from Graeme Rouse's work.}
  s.description = %q{Cloudsponge integration.}

  s.rubyforge_project = "cloudsponge"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "yajl-ruby", "~> 1.1.0"
  s.add_dependency "multi_json", "~> 1.0.4"

  s.add_development_dependency "rspec", "~> 2.7.0"
end
