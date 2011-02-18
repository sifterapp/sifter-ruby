require "fakeweb"
require "sifter"

FakeWeb.allow_net_connect = false

describe Sifter do

  let(:account) { Sifter::Account.new("example.sifterapp.com", "abc123") }

  it "fetches status codes" do
    stub_get("/api/statuses", "statuses.json")

    statuses = account.statuses

    statuses["Open"].should == 1
    statuses.length.should == 4
  end

  it "fetches priority codes" do
    stub_get("/api/priorities", "priorities.json")

    priorities = account.priorities

    priorities["High"].should == 2
    priorities.length.should == 5
  end

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
