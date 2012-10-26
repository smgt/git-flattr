# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib/", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name                            = 'git-flattr'
  s.version                         = GitFlattr::VERSION
  s.authors                         = ['Simon Gate']
  s.email                           = ['simon@smgt.me']
  s.summary                         = %q{Flattr GitHub repositories from the cli}

  s.files                           = `git ls-files`.split("\n")
  s.test_files                      = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables                     = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_runtime_dependency "system_timer"
  s.add_runtime_dependency "flattr"
  s.add_runtime_dependency "launchy"
  s.add_runtime_dependency "commander"
end
