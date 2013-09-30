require 'octokit'

$client = Octokit::Client.new :login => "lewtds", :password => "1234567a"

def get_connections(user)
    followers = $client.followers('lewtds').map { |follower|
        follower[:login]
    }

    connected_users = []
    followers.map { |username|
        location = $client.user(username).location
        if location and location.match(/[vV]iet/) ? username : nil
            connected_users.push(username)
        end
    }
    connected_users
end

puts get_connections("lewtds")
