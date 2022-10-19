require 'gem2deb/rake/testtask'

Gem2Deb::Rake::TestTask.new do |t|
  t.libs = ['test']

  # stuff that is not available in Debian as of 2018-07-14
  excludes = [
    'test/test_eco_processor.rb',
    'test/test_closure_compressor.rb',
    'test/test_yui_compressor.rb',
  ]
  exclude_tests = ['--exclude=/eco|closure|yui/']

  t.test_files = FileList['test/**/test_*.rb'] - excludes + exclude_tests
end
