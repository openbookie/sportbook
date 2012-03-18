
## Major

* add export to JobsController (use keys for export tips in csv/plain text)
* Use de locale
* add knockout flag to game
* add score3,4,5,6  if knockout (verlaengerung, elfmeter)
* add next player/previous player nav
* add indices to db schema for foreign keys



## Minor

* all tips - add bingo class to score in td if match, use .smaller (80%) eg .bingo.smaller and keep .bingo 100%
* add google analytics to layout
* add forms for teams
* use class buttons plus div for buttons to remove in print 

## Cleanup

* Rename module Euro2012 to Wettpool (to match new project name)
* Move error_messages to shared partial
* Use fmt_date helper for date display
* Remove [] from view for calculated teams (is now part of team name)

* Use autofocus and :focus (HTML5) instead of class .focus (does it work?)
* Use new reader pool.full_title
* Rename pool.user to pool.manager