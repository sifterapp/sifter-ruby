require "httparty"
require "hashie"

class Sifter

  include HTTParty

  autoload :Account, "sifter/account"
  autoload :Project, "sifter/project"

  # SLIME
  class Sifter::Issue < Hashie::Mash; end
  class Sifter::Milestone < Hashie::Mash; end
  class Sifter::Person < Hashie::Mash; end
end
