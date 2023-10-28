Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you purchased this from anywhere other than my tebex page, you have a stolen version.

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/jixelpatterns

-------------------------------------------------------------------------------------------------

# Usage

This script idea came from wanting to support a business but not being able to buy anything due no one being on duty.
Solution? Backup shop. Help's keep money coming in if no workers are able to turn up.

The items in the config are intended to be items that are crafted, any other items is just a cash cow.

You can add or remove items or jobs easily.

This was intended as an addon for my job scripts but can be used with any RP based job.
It's easy to set up and only installation steps are:

- Add or remove any jobs or items you want to use.
- Adjust the prices to the correct amounts (I suggest putting thee price higher than if someone was to sell them in person)
- Enable the jobs you have with going through each job and changing `enable = false` to `enable = true`
- Make sure the spawn locations of the shops NPC's are in a fair location (if doors are locked, don't put them inside?)
- Bosses can only access the closed shop stash through the ped's shop or typing `/closedstock`

# Changelog

## v1.8
	- Added support for `OX_lib` Context Menu's
	- Added beta support for `OX_Inv`
		- This handles checking and removing from the `ox_iventory` database
	- Added beta support for `OX_Lib` input for buying items
	- Attept to fix `QS-Inventory` database support

## v1.7
	- Removed support for `qb-bossmenu`
	- Add support for `qs-inventory` stashes
	- Add support for `Renewed-Banking`
	- Add locale system
	- Added system to grab model size for automatically making qb-target boxes
	- Updated install.md

## v1.6.1
	- Attempt to fix the double peds spawning
	- Add OnPlayerUnload event to update the list when someone logs out
	- Better updating of duty list
		- Checks each job to see if it actually needs to edit the peds

## v1.6
	- New functions.lua file to tidy and add new functions
	- Fix deletion of peds error when people go on and off of duty
	- Access to boss only stash stock is now inside the shop menu
	- Command '/closedstock' added to allow bosses to access their closed shop stash
		- This requires them to be near where the ped/prop appears (on duty and off duty)
	- General Optimzations

## v1.5
	- Update duty detection
		- Fixed job changes not being detected correctly
		- Changed how players are updated with new duty lists
	- Added Jim-Bakery to default config
	- Changed default pizzathis items to boxes instead of slices
	- Removed "Heading" from each location to use vec4's instead.
	- If you don't have the required job, it will skip making it the store
	- General code optimizations
		- Better model/ped loading

## v.1.4.3
	- Added Prints to help with debugging
		- Not mandatory to update unless you are having issues

## v1.4.2
	- Fix for images not working in the payment popup

## v1.4.1
	- Made my own "inventory" callbacks as many scripts rename certain events for..fun?
		- Should now work with any inventory script

## v1.4
	- Changed how peds are spawned and handled
		- Removed check every 5 minutes to instead check changes of duty of players
		- Changed to update the list of peds that spawn when a player goes on and of duty
		- If this doesn't work for you or causes issues, let me know
	- Removed icons appearing next to the headers of items in favour of support for qb-menu icon support
		- This is more for optimization and tidier code

## v1.3
	- Added percentage reduction of sales money that would go to the society
		- Add a 15% percentage reduction of the sale to be taken to help reduce businesses just letting npcs work for them
		- Business owners can raise the closedshop price (to reduce players refusing to RP for items)
		- This also means business will be at a loss of money if they rely on the closed shops
		- A good middle ground in my opinion
	- Added support for Renewed Scripts qb-businesses
		- Just put your generated item name into the config like all the others and the script should do the rest
	- Added toggle for qb-management and qb-bossmenu
	- Added support for my qb-menu edit
	- QoL optimizaions
		- In your config, you will need to edit the store peds/props to look like `prop_vend_coffe_01` basically remove the quotation marks(") and replace with (`)
	- Added a couple qb-log lines to help track sales

## v1.2
    - Fixed exploit with adding items to stash for free
    - Attempt at optimizing and improving the speed of the duty check loop
        - This was causing a lot of lag issues on bigger population servers
        - Greatly increased check timer from 2 seconds to 5 minutes (300000) this can be changed easily
        - This makes the "Closed Shop" open 5 minutes after everyone is classed as off duty for that job
        - Before it was doing several server checks every 2 seconds, now its one every 5 minutes.
		- This new loop actually speeds up the spawn times of props/peds

## v1.1.1
	- Quick qb-management update
		- Payments now go into society bank account

## v1.1
	- Fixed Stash item check saying out of stock if the first item slot was empty
	- Added ability to add a Prop instead of the NPC
		- You can add different props, most work well, the default qb-target zone be big enough too
		- Different props obviously may not fit and may need their coords moving slightly
		- I've added props to each config table, but to enable you need to comment/remove the "ped" line
		- I've also adjusted a few/most locations so it works better for both ped/props
	- Added support for "Unique" items
		- This makes it so multiple of the same items in different slots are added to the list as one choice with an amount
		- If item is classed as "Unique" the pay menu removes the amount choice and only sell's one at a time. (This stops stacking of a unique item)
	- Added variable to add to Config.Shops "NoLimitStash"
		- This removes the slot limit and set its to a 100 slot stash
		- See an example of this in "CatCafe" Config.Shop Table