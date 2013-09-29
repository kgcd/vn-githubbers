# user1 -> 1st query -> query 
require 'octokit'
require 'set'

$client = Octokit::Client.new :login => "lewtds", :password => "1234567a"
$my_set = Set.new

users = gets.chomp

def query(users)
  followers = $client.followers("#{users}")[0..2].map { |follower|
    follower[:login]
  }

  new_followers = followers.select { |follower| !$my_set.include? (follower) }

  new_followers.each { |username|

    puts 'I am running ' + username

    $my_set.add(username)
    
    user = $client.user username

    if user.location and user.location.match("[Vv]iet")
      puts username
    end
    
  }
end

while 1 do
  query("#{users}").each { |result| 
    query(result)
  }
end 
