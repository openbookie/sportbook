// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(
 function() {
  $( 'input:text, select' ).each( function() {  
     $(this)
       .focus( function() { $(this).addClass( 'focus' ) })
       .blur( function()  { $(this).removeClass( 'focus' ) });
  });

  $( 'input:radio, input:checkbox' ).each( function() {  
     $(this)
       .wrap( "<span></span>" )
       .focus( function() { $(this.parentNode).addClass( 'focus' ) })
       .blur( function()  { $(this.parentNode).removeClass( 'focus' ) });
  });
  
  $( '[data-autofocus]' ).each( function() {
     $(this).focus();
  });
});


function autofillPlayTips()
{
  $( '.play .tip-score-input' ).each( function( idx, el ) {

    var $score1 = $(el).find( 'input[type=text][data-autofill=score1]');
    var $score2 = $(el).find( 'input[type=text][data-autofill=score2]');

    var knockout = $score1.attr( 'data-knockout' );

    var toto12x = -1;

    // use heimspiel regel
    //  50% chance winning team1
    //  30% chance winning team2
    //  20% chance draw
    if( knockout == 'true' )
    {
      // 0,1,2,3,4 => team1 wins, 5,6,7 => team2 wins
      toto12x = Math.floor(Math.random()*8) // 0-7
    }
    else
    {
      // 0,1,2,3,4 => team1 wins, 5,6,7 => team2 wins, 8,9 => draw)
      toto12x = Math.floor(Math.random()*10)  // 0-9
    }

    var base = Math.floor(Math.random()*4);  // 0-3
    // note: val1 must score at least 1 goal to win (cannot be 0) 
    var val1 = Math.max( 1, base+Math.floor(Math.random()*3) );  // possibly add 0-2
    // note: val2 must be at leat one less than val1 and >= 0
    var val2 = Math.min( val1-1, Math.max( 0, val1-Math.floor(Math.random()*3))); // possibly sub 0-2
    
    
    if( toto12x == 0 || toto12x == 1 || toto12x == 2 || toto12x == 3 || toto12x == 4 ) // team1 wins
    { 
      $score1.val( val1 );
      $score2.val( val2 ); 
    }
    else if( toto12x == 5 || toto12x == 6 || toto12x == 7 ) // team2 wins
    { 
      $score1.val( val2 );
      $score2.val( val1 ); 
    }
    else if( toto12x == 8 || toto12x == 9 ) // draw
    {
      $score1.val( base );
      $score2.val( base ); 
    }
  });
} // function autofillPlayTips