# Description:
#   /r/aww learning the imgur json
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot aww me - Display a random aww
#   hubot aww bomb <number> - Display a number of /r/aww pics
#
# Author:
#   jjasghar - kinda, stolen too ;)
#

module.exports = (robot) ->

  robot.respond /aww me/i, (msg) ->
    capybaraMe(msg, 1)

  robot.respond /aww bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    capybaraMe(msg, count)


capybaraMe = (msg, num) ->
  msg.http("http://imgur.com/r/aww.json")
     .get() (err, res, body) ->
       content = JSON.parse(body)
       for i in [1..num]
         capy = msg.random content.data
         msg.send "http://imgur.com/#{capy.hash}#{capy.ext}"

