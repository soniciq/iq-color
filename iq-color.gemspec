# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "iq/color/version"

Gem::Specification.new do |s|
  s.name        = "iq-color"
  s.version     = IQ::Color::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jamie Hill"]
  s.email       = ["jamie@soniciq.com"]
  s.homepage    = "http://github.com/soniciq/iq-color"
  s.summary     = %q{A series of classes for handling color conversion.}
  s.description = %q{IQ::Color provides simple classes for representing colour values and the conversion to and from CSS3 strings.}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
