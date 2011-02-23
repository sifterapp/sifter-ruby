class Sifter::Project < Hashie::Dash

  property :name
  property :archived
  property :primary_company_name
  property :url
  property :api_url
  property :issues_url
  property :milestones_url
  property :people_url
  property :api_milestones_url
  property :api_people_url
  property :api_issues_url
  property :api_categories_url

  def issues
    Sifter.
      get(api_issues_url).
      fetch("issues", []).
      map { |i| Sifter::Issue.new(i) }
  end

  def milestones
    Sifter.
      get(api_milestones_url).
      fetch("milestones", []).
      map { |m| Sifter::Milestone.new(m) }
  end

  def people
    Sifter.
      get(api_people_url).
      fetch("people", []).
      map { |p| Sifter::Person.new(p) }
  end

end
