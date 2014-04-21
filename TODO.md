
- clean up activity for winning teams
 shows up in /time3  (timeline)
Gery tippt 1. Platz => FC Bayern München 2. Platz => Chelsea im Wettpool >UITS Champions League (Europe) 2013/14<. - 13 Tage (2014-04-08 19:10:45 +0200) 


## Major

* add styles for print for bingo classes
* add index on tip.toto12x

* add export to JobsController (use keys for export tips in csv/plain text)
* Use de locale
* add next player/previous player nav
* add indices to db schema for foreign keys

* link names in play view (cleanup playController/route)
* fix edit play view (add toto and bingo and result cols like in show view if not editable)

## Minor

* add google analytics to layout
* use class buttons plus div for buttons to remove in print 
* change Key in form to Import/Export Key (only used for import/export)

## Cleanup

* Move error_messages to shared partial
* Use fmt_date helper for date display

* Use autofocus and :focus (HTML5) instead of class .focus (does it work?)
* Use new reader pool.full_title
* Rename pool.user to pool.manager


## Done / Complete

* add knockout flag to game
* add score3,4,5,6  if knockout (verlaengerung, elfmeter)
* all tips - add bingo class to score in td if match, use .smaller (80%) eg .bingo.smaller and keep .bingo 100%
* add forms for teams
* Remove [] from view for calculated teams (is now part of team name)
* add PlayersController (nested inside pool) 
* todo/fix: pass in play.id NOT user.id in PlaysControllerRoutes!
  ** make play controller top level (no need to nest inside pool??)
  ** search for pool_play_path, pool_plays_path,etc.
* Rename module Euro2012 to Wettpool (to match new project name)
  