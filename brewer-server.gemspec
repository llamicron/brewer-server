require 'rake'

Gem::Specification.new do |s|
  s.name               = "brewer-server"
  s.version            = "0.0.03"
  s.default_executable = "brewer-server"

  s.authors = ["Luke Sweeney", "Jake Gutierrez"]
  s.date = %q{2017-04-25}
  s.description = %q{A web interface for llamicron/brewer}
  s.post_install_message = "🍺  have fun 🍺"
  s.email = %q{luke@thesweeneys.org}
  # s.files = FileList.new(['lib/', 'lib/brewer/', 'lib/brewer/server/*.rb', 'bin/*', 'lib/views/*', '[A-Z]*', 'spec/*.rb']).to_a
  s.files = Dir.glob("{bin,lib,views}/**/*")
  s.executables = ['brewer-server']
  s.bindir = 'bin'
  s.test_files = FileList.new(["spec/*.rb"]).to_a
  s.homepage = %q{https://rubygems.org/gems/brewer-server}
  s.require_paths = ["lib", "lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A web interface for llamicron/brewer}
  s.license = 'MIT'

  # Runtime dependencies
  s.add_runtime_dependency 'brewer'
  s.add_runtime_dependency 'brewer-stats'
  s.add_runtime_dependency 'wannabe_bool'
  s.add_runtime_dependency 'require_all'
  s.add_runtime_dependency 'thin'
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'sinatra-sse'
  s.add_runtime_dependency 'rack-flash3'
  s.add_runtime_dependency 'rack-test'


  # Dev dependencies
  s.add_development_dependency 'rake', '~> 12.0', '>= 12.0.0'
  s.add_development_dependency 'rspec', '~> 3.5.0', '>= 3.5.0'
  s.add_development_dependency 'launchy', '~> 2.4', '>= 2.4.0'
  s.add_development_dependency 'simplecov', '~> 0.13.0'
  s.add_development_dependency 'simplecov-html', '~> 0.10.0'
  s.add_development_dependency 'rdoc', '~> 5.1', '>= 5.1.0'
end
