require "sifter"
require "optparse"

options = {}
opts = OptionParser.new do |opts|
  opts.banner = <<-EOF
    Usage:
      milestones -t <token> -a <account> -p <project> [-m <name>]

    Options:
  EOF

  opts.on("-tTOKEN", "--token TOKEN", "Sifter API token") do |t|
    options[:token] = t
  end

  opts.on("-aACCOUNT", "--account ACCOUNT", "Account/subdomain to query") do |a|
    options[:account] = a
  end

  opts.on("-mMILESTONE", "--milestone MILESTONE", "Milestone to query") do |m|
    options[:milestone] = m
  end

  opts.on("-pPROJECT", "--project PROJECT", "Project to query") do |p|
    options[:project] = p
  end
end

opts.parse!

if __FILE__ == $PROGRAM_NAME
  unless options.has_key?(:account) && options.has_key?(:token)
    puts "Account and token parameters required."
    exit 1
  end

  hostname = "#{options[:account]}.sifterapp.com"
  token = options[:token]
  account = Sifter::Account.new(hostname, token)
  if options.has_key?(:project)
    project = account.projects.select { |p|
      p.name.downcase == options[:project].downcase
    }.first

    puts "Milestones:"
    project.milestones.each { |m| puts "  #{m.name}" }
  else
    puts "Projects:"
    account.projects.each { |p| puts "  #{p.name}" }
  end
end
