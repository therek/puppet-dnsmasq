require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]
PuppetLint.configuration.relative = true
PuppetLint.configuration.fail_on_warnings = true

exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  ".vendor/**/*",
  "spec/**/*",
]
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc "Run acceptance tests"
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc "Clean fixtures"
task :clean_fixtures do
  FileUtils.rmtree 'spec/fixtures/modules'
end

desc "Run syntax, lint, and spec tests."
task :test => [
  :metadata_lint,
  :clean_fixtures,
  :syntax,
  :lint,
  :spec,
]
