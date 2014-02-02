if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require 'bundler/setup'

require 'coveralls'
Coveralls.wear!

require "fakeweb"
require "sifter"

FakeWeb.allow_net_connect = false

RSpec.configure do

  # Gratuitously borrowed from Wynn Netherland's gowalla gem
  def stub_get(url, filename, options={})
    opts = {
      :body => fixture_file(filename),
      :content_type => 'application/json; charset=utf-8'
    }.merge(options)
    FakeWeb.register_uri(:get, sifter_url(url), opts)
  end

  def fixture_file(filename)
    return filename if filename == ''
    file_path = File.expand_path(
      File.dirname(__FILE__) + '/fixtures/' + filename
    )
    File.read(file_path)
  end

  def sifter_url(url)
    url =~ /^http/ ? url : "https://example.sifterapp.com#{url}"
  end

end
