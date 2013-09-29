require 'octokit'

client = Octokit::Client.new :login => "lewtds", :password => "1234567a"
followers = client.followers('lewtds').map { |follower|
    follower[:login]
}

followers.each { |username|
    user = client.user username
    puts user.location
}
