# PixieLabs_TechTest
A Poker Tech Test for Pixie Labs

## Features
-	Users can enter the number of players and the number of cards they want dealt to each player

![screen shot 2018-12-16 at 15 18 35](https://user-images.githubusercontent.com/42243785/50055826-b6a5b980-014b-11e9-844b-f7a288fa60f4.png)

-	Users can see the hand they were dealt and who won

![screen shot 2018-12-16 at 15 19 00](https://user-images.githubusercontent.com/42243785/50055814-9f66cc00-014b-11e9-8888-d120f5fab279.png)

-	In the case of a draw, there are two winners (or more)

![screen shot 2018-12-16 at 16 04 06](https://user-images.githubusercontent.com/42243785/50055864-40558700-014c-11e9-84c2-192a2773aa65.png)

## Technologies

- Ruby
- RSpec
- Capybara for the feature tests
- Sinatra as a web framework
- Sinatra Flash for the error message
- Simple_cov to measure test coverage
- Simple_cov console to easily view the test coverage


## Approach

### Testing

- I do have 100% test coverage, and had high test coverage throughout development, but while writing I prioritised testing a little less than I normally do. Normally I try and test everything, but in the Pixie Labs Playbook there is the advice not to chase 100% test coverage (I also had a conversation with David from Pixie Labs, questioning how useful TDD is) and I wanted to try out this approach and see what happened. I felt extremely rebellious and I liked it! It was very nice to be able to feel that I could put some tricky testing cases to one side and come back to them if I had time at the end.

![screen shot 2018-12-16 at 20 27 27](https://user-images.githubusercontent.com/42243785/50058503-19f61280-0171-11e9-8e6b-1cd54c22d6dc.png)


### Structure

-	The Dealer class deals the cards.
-	The Calculator class works out who’s won. It also prints out a single or plural statement depending on who’s won (winner_or_winners_method). This does feel like a violation of the Single Responsibility Principle, but it seemed excessive to create a new class just for this simple method. I later added a Formatter class to deal with the issue below, and if I'd had more time I would consider refactoring winner_or_winners into there, as it's about formatting.
- The Formatter class formats the scores record, to change 11, 12, 13 to Jack, Queen, King, in order to make the deck more "deck-like" for the user.

### “Interesting” Decisions

-	The deck that I have seems overly complicated (an array of 52 hashes), but as did any way of storing the cards. It might have been better to have the deck as strings in an array, but that seemed like it would create a lot of work when it came to adding the scores. I also couldn’t work out how to have all the cards in just one single hash, as randomly selecting a value from that turned out to be complicated.
-	There is some logic in my views, but I couldn’t find a way around it. I’m aware it’s not ideal.  
-	The same goes for the controller.
-	I shuffled the deck each time as this was in the specification, but this did feel unnecessary, as I was selecting a random card each time anyway.

## How to run locally

-	Clone this repo
```
$ bundle install
$ rack_up
```
-	Visit localhost:9292

## Tests
To test:
```
$ rspec
```

## Deployed

- Deployed with heroku https://cryptic-plains-28757.herokuapp.com

## Other requirements

-	It works on my iPhone iOS 12.1.1
-	It works across all the browsers specified
-	100% Test coverage

## What I learnt

- I started off in the wrong direction and learnt a lot from it. In my last couple of weeks at Makers, I had some feedback that I should try to plan less and let the classes evolve naturally as my code progressed. I definitely didn’t follow that advice well enough this time, and got tempted into doing a lot of planning before hand. My game-setup class turned out to be useless. I think I should have started with what I needed – a page asking the user to input values.  There was no point building a class that prints statements to the console and then asks for user_input, I had overthought it too much.


## What I would do if I had more time

- I would have liked to have the players enter their names and then have the cards dealt to them by name, but as the number of players varied, at the time this seemed complicated. Now it seems simple! I would probably store the player names in an array, then iterate through each one and have my deal method work as normal, but replace players_counter with the player name. The while loop would continue until there are no more names left in the array.
