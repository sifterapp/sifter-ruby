require "httparty"
require "hashie"

class Sifter

  include HTTParty

  autoload :Account, "sifter/account"
  autoload :Project, "sifter/project"

  # Wrapper around an issue.
  class Issue < Hashie::Dash

    property :number
    property :subject
    property :description
    property :priority
    property :status
    property :assignee_name
    property :assignee_email
    property :category_name
    property :milestone_name
    property :opener_name
    property :opener_email
    property :comment_count
    property :attachment_count
    property :created_at
    property :updated_at
    property :url
    property :api_url
    property :comments_url

  end

  # Wrapper around a milestone.
  class Milestone < Hashie::Dash
    
    property :name
    property :due_date
    property :url
    property :api_url
    property :issues_url
    property :api_issues_url
    
  end

  # Wrapper around a person.
  class Person < Hashie::Dash
    
    property :username
    property :first_name
    property :last_name
    property :email
    
  end

end
