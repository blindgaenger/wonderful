# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'wonderful/version'

Gem::Specification.new do |s|
  s.name        = 'wonderful'
  s.version     = Wonderful::VERSION
  s.authors     = ['blindgaenger']
  s.email       = ['blindgaenger@gmail.com']
  s.homepage    = 'https://github.com/blindgaenger/wonderful'
  s.summary     = %q{happy path testing}
  s.description = %q{happy path testing … for those who are blinded by love}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake', '~> 0.8.7'
end
