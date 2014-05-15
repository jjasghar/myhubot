# Description:
#   Who don't like pretty girl 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot she's pretty - Receive a pretty girl


module.exports = (robot) ->

  robot.respond /she's pretty/i, (msg) ->
    msg.http("http://www.reddit.com/r/gentlemanboners/new.json?limit=100")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).data.children[Math.floor(Math.random() * 100)].data.url
