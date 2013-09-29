# user1 -> 1st query -> query
require 'octokit'
require 'set'

$client = Octokit::Client.new :login => "lewtds", :password => "1234567a"
$my_set = Set.new

users = gets.chomp

def vietnamese_name? name
  name.downcase.match /
    nguyen|
    tran|
    pham|
    huynh|
    hoang|
    phan|
    quan|
    duong|
    vn|
    tuan|
    huy|
    thanh|
    linh|
    tuan|
    khanh|
    thien|
    hieu|
    xuan|
    binh|
    duy|
    giang|
    nhung|
    ngoc|
    thuy|
    ngan|
    hang|
    uyen|
    yen/x != nil
end


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
