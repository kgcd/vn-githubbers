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
    
	followers.each { |username|
	      
    		user = $client.user username
	        #puts  username, user.location
	        if user.location and user.location.match("[Vv]iet")
	            puts username
	            $my_set.add(username)
	        end
	        
	        }

end
while 1 do
	query("#{users}").each { |result| 
		query(result)
}
end 
