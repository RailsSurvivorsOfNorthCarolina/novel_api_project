#Weather Effects on Game Reviews API
###Overview
  This program takes in API's from IGN and The
Weather Underground and spits out an API which gives weather data the day of a games release in addition to the IGN score of the game in order to determine "weather" or not (pun intended) weather has an impact on game reception.


###To Run...
* Copy repository from [here](https://github.com/RailsSurvivorsOfNorthCarolina/novel_api_project.git)
* Sign in to weather underground and receive an API-Key [here](http://www.wunderground.com/weather/api/d/docs)
* Get an API-Key for IGN by going [here](https://www.mashape.com/cosmin/ign-com-video-games-rating)
  * Your key will be in the request example box on the right side of the screen next to `X-Mashape-Key:`
* Replace `WU_KEY` in the get_data method in the `historical_weather.rb` file with your Weather Underground key
* Replace `IGN_KEY` in the get_data method in the `game_review.rb` file with your IGN key

* Once the repository has been cloned to your computer, run `rails server` in the terminal
* Navigate to `http://localhost.3000` in your browser
  * You should see `Welcome Aboard You're riding Ruby on Rails!`
  * You're now almost ready to search for game information!
* Type `http://localhost:3000/api/v1/game_reviews/`
  * At the end of the address, type in any game you want to search for and get ready to see the results!

##Comments
We approached this project by first focusing on effectively taking in the two API's we would be using. We established tests for our two API's and went to work. Once all tests passed and we were happy on the data we chose to use we proceeded to the meat of the assignment which was getting the two API's to work together and produce our own.

The trick of this program was that the Weather Underground API needs a date in the form of year/month/day (20060504) and IGN's API provided it's review date in a string of other information (May 12, 2006 journey to the mushroom kingdom and ...). If you look in the game_review model, the date_converter method solves this using various regular expressions.

The most difficult part of this build was the game_info and weather_info methods within our game and weather models. The weather_info method in particular required heavy modification of our existing methods which in turn causes some tests to fail, however made the program function properly.
