# Description
#   returns steam daily deal info from store.steampowered.com
#
# Configuration:
#   none
#
# Dependencies:
#   "cheerio": "~0.16.0"
#
# Commands:
#   steamdeal? - returns steam daily deal info from store.steampowered.com
#
# Author:
#   nickfletcher
 
cheerio = require 'cheerio'
 
module.exports = (robot) ->
  robot.hear /^(steamdeal\?)$/i, (msg) ->
    robot.http('http://store.steampowered.com')
      .get() (err, res, body) ->
        if err
          msg.send "Unable to get the Steam daily deal."
        if !err && res.statusCode == 200
          $ = cheerio.load(body)
          gameUrl = $('.dailydeal a').attr('href')
          regPrice = $('.dailydeal_content .discount_original_price').text()
          salePrice = $('.dailydeal_content .discount_final_price').text()
          percentOff = $('.dailydeal_content .discount_pct').text()
          robot.http(gameUrl)
            .get() (err, res, body) ->
              $ = cheerio.load(body)
              gameName = $('.apphub_AppName').text()
              deal = gameName + ' is ' + salePrice + ' (' + percentOff + ') today. Regular price: ' + regPrice + '.' + ' (' + gameUrl + ')'
              msg.send deal

