# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name                            = 'git-flattr'
  s.version                         = '0.0.2'
  s.authors                         = ['Simon Gate']
  s.email                           = ['simon@smgt.me']
  s.summary                         = %q{Flattr GitHub repositories from the cli}

  s.files                           = `git ls-files`.split("\n")
  s.test_files                      = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables                     = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_runtime_dependency "flattr"
  s.add_runtime_dependency "launchy"
end
