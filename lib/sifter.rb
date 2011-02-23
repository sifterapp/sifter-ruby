require "httparty"
require "hashie"

class Sifter

  include HTTParty

  autoload :Account, "sifter/account"
  autoload :Project, "sifter/project"

  class Issue < Hashie::Dash

    property :number
    property :subject
    property :description
    property :priority
    property :status
    property :assignee_name
    property :category_name
    property :milestone_name
    property :opener_name
    property :url
    property :api_url
    
  end

  class Milestone < Hashie::Dash
    
    property :name
    property :due_date
    property :url
    property :api_url
    property :issues_url
    property :api_issues_url
    
  end

  class Person < Hashie::Dash
    
    property :username
    property :first_name
    property :last_name
    property :email
    
  end

end
