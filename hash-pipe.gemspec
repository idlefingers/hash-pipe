$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "hash-pipe"
  s.version     = "0.1.0"
  s.authors     = ["Damien Timewell"]
  s.email       = ["mail@damientimewell.com"]
  s.licenses    = ['MIT']
  s.homepage    = "https://github.com/idlefingers/hash-pipe"
  s.summary     = "A small collection of useful hash extensions"
  s.description = ""

  s.add_dependency 'activesupport', '~> 4.1'

  s.add_development_dependency "rspec", '~> 2.14'
  s.add_development_dependency "pry", '~> 0.9'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
end
