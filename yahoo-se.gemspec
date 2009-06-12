Gem::Specification.new do |s|
  s.name = "yahoo-se"
  s.version = "1.2.1"
  s.date = "2009-06-09"
  s.summary = "Ruby gem for Yahoo! Site Explorer"
  s.email = "info@rubyskills.com"
  s.homepage = "http://www.rubyskills.com"
  s.authors = ["Lance Carlson", "Michael Erb", "Alex Pooley", "Erik Ostrom"]
  s.add_dependency('json')
  s.files = [
    'LICENSE',
    'Rakefile',
    'README', 
    'lib/yahoo-se.rb', 
    'lib/yahoo-se/exceptions.rb',
    'lib/yahoo-se/inlinks.rb',
    'lib/yahoo-se/paginator.rb',
    'lib/yahoo-se/pages.rb',
    'lib/yahoo-se/ping.rb',
    'lib/yahoo-se/request.rb',
    'lib/yahoo-se/response.rb',
    'lib/yahoo-se/result.rb',
    'lib/yahoo-se/update_notification.rb',
    'lib/yahoo-se/version.rb',
    'spec/fixtures/empty_results.json',
    'spec/fixtures/erbmicha.com_backlinks.json',
    'spec/fixtures/erbmicha.com_pages.json',
    'spec/fixtures/erbmicha.com_ping.json',
    'spec/fixtures/exceed_error.json',
    'spec/fixtures/one_result.json',
    'spec/fixtures/rate_limit_exceeded.json',
    'spec/spec.opts',
    'spec/spec_helper.rb',
    'spec/yahoo-se/inlinks_spec.rb',
    'spec/yahoo-se/pages_spec.rb',
    'spec/yahoo-se/ping_spec.rb',
    'spec/yahoo-se/request_spec.rb',
    'spec/yahoo-se/response_spec.rb',
    'spec/yahoo-se/result_spec.rb',
    'spec/yahoo-se/update_notification_spec.rb',
    'spec/yahoo-se-matchers.rb',
    'spec/yahoo-se_spec.rb'
    ]
  s.require_path = "lib"
  s.has_rdoc = true
end
