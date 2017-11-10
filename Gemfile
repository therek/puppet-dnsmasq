source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :test do
  gem 'rake',                      :require => false
  gem 'rspec-puppet',              :require => false
  gem 'puppetlabs_spec_helper',    :require => false
  gem 'metadata-json-lint',        :require => false
  gem 'rspec-its',                 :require => false
  if puppetver = ENV['PUPPET_VERSION']
    gem 'puppet', puppetver,       :require => false
  else
    gem 'puppet', '~> 5.0',        :require => false
  end
  gem 'rspec-puppet-facts',        :require => false
  gem 'facterdb',                  :require => false
  gem 'semantic_puppet',           :require => false
end

# vim:ft=ruby
