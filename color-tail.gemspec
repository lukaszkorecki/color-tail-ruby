# encoding: utf-8
Gem::Specification.new do |s|
  s.name        = 'color-tail'
  s.version     = '0.1.0'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Łukasz Korecki'
  s.email       = 'lukasz@coffeesounds.com'
  s.summary     = 'Just like tail -f but with colors'
  s.description = 'Use it like tail -f to watch a group of files, but with added color codes'

  s.files         = ['color-tail.rb']
  s.require_path  = '.'
  s.executables = [ 'ctail']

  s.add_runtime_dependency('eventmachine')
  s.add_runtime_dependency('eventmachine-tail')
  s.add_runtime_dependency('term-ansicolor')
end
