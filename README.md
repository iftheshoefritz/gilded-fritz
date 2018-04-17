## Gilded Rose Distributed setup

The Tavern is now distributed! To take advantages of our awesome new architecture, checkout this repo, then run

    > ./startup.sh

This could take a long time in the build phase, to download the ruby:2.5.0 image that these containers are
based on.

Startup.sh attaches you to the Distributed Tavern client container, which runs in a loop FOREVER.

- To exit without stopping the container, press CTRL-P CTRL-Q (To attach to the container again, run `docker attach gilded_client`)
- To exit and stop the client container press CTRL-C (To come back: `docker-compose up -d client`, then `docker attach gilded_client`)

To read logs, run `docker logs -f gilded_api` or `docker logs -f gilded_client`

To rebuild the containers after you've changed the source, shut everything down (`docker-compose down`) then run `./startup.sh` again

## Gilded Rose Requirements Specification

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class as it belongs to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership.

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

## Changes from the original
See the original here: https://github.com/emilybache/GildedRose-Refactoring-Kata

I made the following changes:
- Ruby version only
- RSpec only
- Added a branch `start-from-specs` with pre-written specs for those who just want to get started refactoring. This is unrealistic (why would such bad code have useful specs?) but it allows us to get to the "let's make this code better" step faster. 
- The TextTests included with the original are excluded because I found it a pain to install TextTest and getting 30 devs to install before starting going to be chaos.
- Moved requirements text file into the README.md


