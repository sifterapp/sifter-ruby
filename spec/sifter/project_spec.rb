require 'spec_helper'

describe Sifter::Project do

  before do
    stub_get("/api/projects", "projects.json")
  end

  let(:account) { Sifter::Account.new("example.sifterapp.com", "abc123") }
  let(:project) { account.projects.select { |p| p.name == "Elephant" }.first }

  it "initializes from a hash" do
    attrs = {
      "name"=>"Elephant",
      "issues_url"=>"https://example.sifterapp.com/projects/189113590/issues",
      "api_milestones_url"=>
      "https://example.sifterapp.com/api/projects/189113590/milestones",
      "primary_company_name"=>"Apple",
      "api_people_url"=>
      "https://example.sifterapp.com/api/projects/189113590/people",
      "url"=>"https://example.sifterapp.com/projects/189113590",
      "archived"=>false,
      "api_issues_url"=>
      "https://example.sifterapp.com/api/projects/189113590/issues",
      "api_categories_url"=>
      "https://example.sifterapp.com/api/projects/189113590/categories",
      "api_url"=>"https://example.sifterapp.com/api/projects/189113590",
      "milestones_url"=>
      "https://example.sifterapp.com/projects/189113590/milestones"
    }

    project = Sifter::Project.new(attrs)
    attrs.each { |k, v| project[k].should == v }
  end

  it "fetches issues" do
    stub_get(project.api_issues_url, "issues.json")

    issues = project.issues

    issues.length.should == 2
    issues.first.should be_a(Sifter::Issue)
  end

  it "fetches milestones" do
    stub_get(project.api_milestones_url, "milestones.json")

    milestones = project.milestones

    milestones.length.should == 2
    milestones.first.should be_a(Sifter::Milestone)
  end

  it "fetches people" do
    stub_get(project.api_people_url, "people.json")

    people = project.people

    people.length.should == 3
    people.first.should be_a(Sifter::Person)
  end

end
