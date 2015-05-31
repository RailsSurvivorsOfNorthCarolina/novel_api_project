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
