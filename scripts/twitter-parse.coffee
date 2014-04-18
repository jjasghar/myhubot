# Description:
#   gets tweet from a url
#
# Dependencies:
#   "twit": "1.1.13"
#   "underscore": "1.4.4"
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#
# Commands:
#   http[s]://twitter.com/<twitter username>/status/<id> - will pull out the tweet for you
#
# Author:
#   KevinTraver
#   dosman711
#   jjasghar

_ = require "underscore"
Twit = require "twit"
config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token: process.env.HUBOT_TWITTER_ACCESS_TOKEN
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

module.exports = (robot) ->
  twit = undefined

  robot.hear /http[s]?:\/\/twitter.com\/(.*)/i, (msg) ->
    unless config.consumer_key
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_KEY environment variable."
      return
    unless config.consumer_secret
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_SECRET environment variable."
      return
    unless config.access_token
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN environment variable."
      return
    unless config.access_token_secret
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN_SECRET environment variable."
      return

    unless twit
      twit = new Twit config

    url = msg.match[1].split("/") 
    name =  url[0]
    id = url[2].toString()

    twit.get "statuses/show/:id",
      {id: id},
      (err, reply) ->
        if err
          return console.log(err)
        return msg.send _.unescape(reply.text) if reply.text
