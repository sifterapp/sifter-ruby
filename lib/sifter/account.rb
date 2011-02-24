# Wrapper around an a Sifter account. Use this as the root for accessing the
# Sifter API.
class Sifter::Account

  # Connect to a Sifter account. The host is the subdomain for your Sifter
  # account (yourhost.sifterapp.com), you can get a token by going to
  # Profile->Access Keys.
  def initialize(host, token)
    Sifter.default_options[:base_uri] = "https://" << host
    Sifter.default_options[:headers] = {"X-Sifter-Token" => token}
  end

  # Fetch the possible issue statuses for this project. This is currently hardcoded
  # in the app, so it's unlikely they'll change anytime soon.
  def statuses
    Sifter.
      get("/api/statuses").
      parsed_response["statuses"]
  end


  # Fetch the possible issue priorities for this project. This is currently hardcoded
  # in the app, so it's unlikely they'll change anytime soon.
  def priorities
    Sifter.
      get("/api/priorities").
      parsed_response["priorities"]
  end

  # Fetch all projects that you have access to for this account. Returns an
  # array of Sifter::Project objects.
  def projects
    Sifter.
      get("/api/projects").
      parsed_response["projects"].
      map { |p| Sifter::Project.new(p) }
  end

end

