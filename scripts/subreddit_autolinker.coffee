# Description:
#   subreddit autolinker
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   /r/<subreddit> - Outputs full link to the subreddit
#
# Author:
#   colindean
#   jjasghar

module.exports = (robot) ->

  robot.hear /\/r\/([A-Za-z0-9\_]*)/i, (msg) ->
    msg.send "http://reddit.com/r/#{msg.match[1]}" if msg.match[1].length > 0
