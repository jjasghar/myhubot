# Description
#   returns the cnn banner from the main page
#
# Configuration:
#   none
#
# Dependencies:
#   "cheerio": "~0.16.0"
#
# Commands:
#   hubot cnn - returns the cnn banner
#
# Author:
#   jjasghar

cheerio = require 'cheerio'

module.exports = (robot) ->

  robot.respond /cnn$/i, (msg) ->

    msg.http('http://www.cnn.com')
      .get() (err, res, body) ->
        if err
          msg.send "Unable to get the cnn banner."
        if !err && res.statusCode == 200
          $ = cheerio.load(body)
          cnnBannerUrl = $('.cnn_banner_large a').attr('href')
          cnnBanner = $('.cnn_banner_large h1').text()
          banner = cnnBanner + ' (' + cnnBannerUrl + ')'
          msg.send banner
