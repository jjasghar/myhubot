# Description:
#   capybaras learning the imgur json
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot capybara me - Display a capybara
#   hubot capybara bomb <number> - Display a number of capybaras
#
# Author:
#   jjasghar - kinda, stolen too ;)
#

module.exports = (robot) ->

  robot.respond /capybara me/i, (msg) ->
    capybaraMe(msg, 1)

  robot.respond /capybara bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    capybaraMe(msg, count)


capybaraMe = (msg, num) ->
  msg.http("http://imgur.com/r/capybara.json")
     .get() (err, res, body) ->
       content = JSON.parse(body)
       for i in [1..num]
         capy = msg.random content.data
         msg.send "http://imgur.com/#{capy.hash}#{capy.ext}"

