# Description:
#   Check you chat window :)
#
# Commands:
#   cd  - Reply with "cd command not found"
#   exit - Reply with "exit command not found"
#   ls - Reply with "ls command not found"
#   reset - Reply with "reset command not found"




module.exports = (robot) ->

  robot.hear /\bcd$/, (msg) ->
    msg.send "cd command not found"

  robot.hear /\bexit$/, (msg) ->
    msg.send "exit command not found"

  robot.hear /\bls$/, (msg) ->
    msg.send "ls command not found"

  robot.hear /\breset$/, (msg) ->
    msg.send "reset command not found"
