# Description:
#   Very doge. So meme.
#
# Commands:
#   hubot doge <very words> - Wow much meme. So advance.
#
# Author:
#   kevinwuhoo

module.exports = (robot) ->
  robot.respond /doge (.+)/i, (msg) ->
    veryWords = msg.match[1]                    # wow, much match
    veryWords = veryWords.replace(/[ ]/g, "")   # wow, none spaces
    veryWords = veryWords.replace(/,/g, "/")    # wow, many delimiter
    msg.send "http://dogr.io/#{veryWords}.png"  # wow, such magic
