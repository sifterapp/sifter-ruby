require "httparty"
require "hashie"

class Sifter

  include HTTParty

  autoload :Account, "sifter/account"
  autoload :Project, "sifter/project"

end
