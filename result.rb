# user1 -> 1st query -> query
require 'octokit'
require 'set'


class GithubGraphBuilder
  def initialize(login, password, seed)
    @seed = seed
    @github = Octokit::Client.new :login => login, :password => password
    @checked = Set.new
    @graph = {}
  end

  def start
    puts @seed
    process_user(@seed)
    puts "    #{@graph[user].to_a}"
    first_tier = @graph[@seed]

    puts "FIRST_TIER: #{first_tier.to_a}"
    second_tier = Set.new
    first_tier.each { |user|
      puts user
      process_user user
      puts "    #{@graph[user].to_a}"
      second_tier.merge(@graph[user])
    }

    second_tier = second_tier.difference @checked

    puts "SECOND_TIER: #{second_tier.to_a}"
    third_tier = Set.new
    second_tier.each { |user|
      puts user
      process_user user
      puts "    #{@graph[user].to_a}"
      third_tier.merge(@graph[user])
    }

    third_tier = third_tier.difference @checked

    puts "THIRD_TIER: #{third_tier.to_a}"
    puts third_tier
    puts @graph
  end

  def process_user(user)
    @graph[user] ||= Set.new
    related_users = find_related(user).select { |user| vietnamese? user }
    related_users.each { |related_user|
      @graph[user].add(related_user.login)
      @graph[related_user.login] ||= Set.new
      @graph[related_user.login].add user
    }

  end

  def find_related(user)
    # Find all the followers from this user
    followers = @github.followers("#{user}").map {|user| user.login}

    # Only query users we haven't checked
    followers.select { |login| !@checked.include? login }
    @checked = @checked.union followers
    followers.map { |login| @github.user login }
  end

  def vietnamese?(user)
    user.location and user.location.match("[Vv]iet")
  end
end


if __FILE__ == $0
  # You should generate a personal API token and use it as the username and
  # leave the password blank.
  #
  # http://developer.github.com/v3/auth/#basic-authentication
  # https://github.com/blog/1509-personal-api-tokens
  builder = GithubGraphBuilder.new("username", "password", "lewtds")
  builder.start
end
