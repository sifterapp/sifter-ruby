require 'spec_helper'

describe Sifter::Project do

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

  it "fetches issues"
  it "fetches milestones"
  it "fetches people"

end
