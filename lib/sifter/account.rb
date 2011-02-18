class Sifter::Account

  def initialize(host, token)
    Sifter.default_options[:base_uri] = "https://" << host
    Sifter.default_options[:headers] = {"X-Sifter-Token" => token}
  end

  def statuses
    Sifter.
      get("/api/statuses").
      parsed_response["statuses"]
  end

  def priorities
    Sifter.
      get("/api/priorities").
      parsed_response["priorities"]
  end

  def projects
    Sifter.
      get("/api/projects").
      parsed_response["projects"].
      map { |p| Sifter::Project.new(p) }
  end

end

