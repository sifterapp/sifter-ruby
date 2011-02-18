require 'spec_helper'

describe Sifter::Account do

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
  
  it "fetches all projects" do
    stub_get("/api/projects", "projects.json")

    projects = account.projects

    projects.length.should == 2
    projects.first.should be_kind_of(Sifter::Project)
  end

end
