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


function clearPlayTips()
{
  // for each game 
  $( '.play .tip-score-input' ).each( function( idx, el ) {

    var $score1 = $(el).find( 'input[type=text][data-autofill=score1]');
    var $score2 = $(el).find( 'input[type=text][data-autofill=score2]');
    var $score3 = $(el).find( 'input[type=text][data-autofill=score3]');
    var $score4 = $(el).find( 'input[type=text][data-autofill=score4]');
    var $score5 = $(el).find( 'input[type=text][data-autofill=score5]');
    var $score6 = $(el).find( 'input[type=text][data-autofill=score6]');

    $score1.val( '' );
    $score2.val( '' );
    $score3.val( '' );
    $score4.val( '' );
    $score5.val( '' );
    $score6.val( '' );
  } );
}


function recalcPlayTips()
{
  var $debug = $( '#debug' );
  $debug.html( '' );  // reset  - todo: is there a better way???
  
  var teams = {};
   
  // for each game 
  $( '.play .tip-score-input' ).each( function( idx, el ) {

    var $score1 = $(el).find( 'input[type=text][data-autofill=score1]');
    var $score2 = $(el).find( 'input[type=text][data-autofill=score2]');

    var knockout    = $score1.attr( 'data-knockout' );
    var team1_id    = $score1.attr( 'data-team1' );
    var team2_id    = $score2.attr( 'data-team2' );
    var group_id    = $score2.attr( 'data-group' );

    var score1 = parseInt( $score1.val(), 10 );
    var score2 = parseInt( $score2.val(), 10 );
    

    if( knockout != 'true' ) // skip knockout games (only calc standing for group games)
    {
    var team1 = teams[ 't'+team1_id ];
    var team2 = teams[ 't'+team2_id ];

    if( team1 == null || team1 == undefined )
    {
      team1 = {
          'team_id':team1_id,
          'played':0,
          'won':0,
          'drawn':0,
          'lost':0,
          'score1':0,
          'score2':0,
          'pts':0,
          'group_id':group_id
        };
    }

    if( team2 == null || team2 == undefined )
    {
       team2 = {
          'team_id':team2_id,
          'played':0,
          'won':0,
          'drawn':0,
          'lost':0,
          'score1':0,
          'score2':0,
          'pts':0,
          'group_id':group_id
         };
    }

      if( isNaN(score1) || isNaN(score2) )  // skip games with invalid scores
      {
         $debug.append( "<p> skipping game w/ score => "+ score1 + ":" + score2 + "</p>" );
      }
      else
      {
         team1.played += 1;
         team1.score1 += score1;
         team1.score2 += score2;

         team2.played += 1;
         team2.score1 += score2;
         team2.score2 += score1;


         if( score1 > score2 ) // team1 wins
         {
            $debug.append( "<p>team1 wins => "+ score1 + ":" + score2 + "</p>" );
            
            team1.won  += 1;
            team1.pts  += 3;
            
            team2.lost += 1;
         }
         else if( score1 < score2 ) // team2 wins
         {
            $debug.append( "<p>team2 wins => "+ score1 + ":" + score2 + "</p>" );

            team1.lost += 1;
            
            team2.won  += 1;
            team2.pts  += 3;
         }
         else // assume draw
         {
            $debug.append( "<p>draw => "+ score1 + ":" + score2 + "</p>" );

            team1.drawn += 1;
            team1.pts   += 1;
            
            team2.drawn += 1;
            team2.pts   += 1;
         }
      }  
      
      teams[ 't'+team1_id ] = team1;
      teams[ 't'+team2_id ] = team2;
      
    } // if != knockout
  } ); // end each game
  
  
  for (var key in teams) {
    if( teams.hasOwnProperty(key) )
    {
      $debug.append( "<p>"+ key + "=> played: " + teams[key].played + ", pts: " + teams[key].pts + "</p>" );
    }
  }

  // fillup standing by group
  
  var groups = {};

  for (var key in teams) {
    if( teams.hasOwnProperty(key) )
    {
      var team = teams[key];
      var group = groups[ 'g'+team.group_id ];
      if( group == null || group == undefined )
        group = [];
   
      group.push( team );
      
      groups[ 'g'+team.group_id ] = group;
    }
  }

  // sort and dump groups

  for(var key in groups) {
    if( groups.hasOwnProperty(key) )
    {
      var group = groups[key];
      $debug.append( "<p>"+ key + "=> length: " + group.length + "</p>" );
      
      group.sort( function( t1, t2 ) {
        if( t1.pts < t2.pts )
          return 1;
        if( t1.pts > t2.pts )
          return -1;
        
        // check for tore1,tore2, etc. bei punktegleichstand
        
        var t1_diff = t1.score1 - t1.score2;
        var t2_diff = t2.score1 - t2.score2;
        
        if( t1_diff < t2_diff )
          return 1;
        if( t1_diff > t2_diff )
          return -1;
        
        // check for who score more goals
        if( t1.score1 < t2.score1 )
          return 1;
        if( t1.score1 > t2.score1 )
          return -1;
        
        return 0;
      });
      
      for(var i=group.length-1; i >= 0; i--)  // use reverse order (for insertAfter to resort table rows)
      {
         var team = group[i];
         $debug.append( "<p>["+ i + "] => pts: " + team.pts + ", diff: " + (team.score1-team.score2) + ", score1: "+ team.score1  +"</p>" );


         var $tr = $( '#standing-t'+ team.team_id );
         
         // get team title html snippet from group
         team.title_html = $tr.find( 'td:nth-child(1)' ).html();
         group[i] = team;
         
         
         $tr.find( 'td:nth-child(2)' ).html( team.played );
         $tr.find( 'td:nth-child(3)' ).html( team.won );
         $tr.find( 'td:nth-child(4)' ).html( team.drawn );
         $tr.find( 'td:nth-child(5)' ).html( team.lost );
         $tr.find( 'td:nth-child(6)' ).html( '' + team.score1 + '-' + team.score2 );
         $tr.find( 'td:nth-child(7)' ).html( team.score1 - team.score2 );
         $tr.find( 'td:nth-child(8)' ).html( team.pts );
         
         $tr.insertAfter( $('#standing-g'+ team.group_id) ); // insertAfter "header" group table row/tr
      }
    }
  }  
 
 
  // for each game  - pass 2 - calculate/replace team titles 
  $( '.play .tip-score-input' ).each( function( idx, el ) {

    var $score1 = $(el).find( 'input[type=text][data-autofill=score1]');
    var $score2 = $(el).find( 'input[type=text][data-autofill=score2]');
    
    var $calc_team1_id =  $(el).find( 'input[type=hidden][data-autofill=calcteam1id]');
    var $calc_team2_id =  $(el).find( 'input[type=hidden][data-autofill=calcteam2id]');

    var calc        = $score1.attr( 'data-calc' );
    var group_id    = $score1.attr( 'data-group' );
    var game_id     = $score1.attr( 'data-game' );
    
    var team1_calcrule    = $score1.attr( 'data-calcrule' );
    var team1_calcvalue   = $score1.attr( 'data-calcvalue' );
    var team1_placeholder = $score1.attr( 'data-placeholder' );

    var team2_calcrule    = $score2.attr( 'data-calcrule' );
    var team2_calcvalue   = $score2.attr( 'data-calcvalue' );
    var team2_placeholder = $score2.attr( 'data-placeholder' );

    var team1_id    = $score1.attr( 'data-team1' );
    var team2_id    = $score2.attr( 'data-team2' );

    var score1 = parseInt( $score1.val(), 10 );
    var score2 = parseInt( $score2.val(), 10 );
    

    if( calc == 'true' ) 
    {
       if( team1_calcrule == 'group-winner' )
       {
         var group = groups[ 'g'+ team1_calcvalue ];
         var team  = group[0];
         if( team.played > 0 )
         {
            $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html( team.title_html );
            $calc_team1_id.val( team.team_id );
         }
         else // use (reset to) placeholder
         {
            $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html( team1_placeholder );
            $calc_team1_id.val( '' );
         }
       }
       else if( team1_calcrule == 'group-2nd' )
       {
         var group = groups[ 'g'+ team1_calcvalue ];
         var team  = group[1];
         if( team.played > 0 )
         {
            $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html( team.title_html );
            $calc_team1_id.val( team.team_id );
         }
         else // use (reset to) placeholder
         {
            $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html( team1_placeholder );
            $calc_team1_id.val( '' );
         }
       }
       else if( team1_calcrule == 'game-winner' )
       {
          var $tr = $( '#game'+team1_calcvalue );
          var $score1 = $tr.find( 'input[type=text][data-autofill=score1]');
          var $score2 = $tr.find( 'input[type=text][data-autofill=score2]');
          var $score3 = $tr.find( 'input[type=text][data-autofill=score3]');
          var $score4 = $tr.find( 'input[type=text][data-autofill=score4]');
          var $score5 = $tr.find( 'input[type=text][data-autofill=score5]');
          var $score6 = $tr.find( 'input[type=text][data-autofill=score6]');
          
          var $game_winner_calc_team1_id = $tr.find( 'input[type=hidden][data-autofill=calcteam1id]');
          var $game_winner_calc_team2_id = $tr.find( 'input[type=hidden][data-autofill=calcteam2id]');


          var score1 = parseInt( $score1.val(), 10 );
          var score2 = parseInt( $score2.val(), 10 );
          var score3 = parseInt( $score3.val(), 10 );
          var score4 = parseInt( $score4.val(), 10 );
          var score5 = parseInt( $score5.val(), 10 );
          var score6 = parseInt( $score6.val(), 10 );
          
          if( (isNaN(score1) || isNaN(score2)) ||
              (score1 == score2 && (isNaN(score3) || isNaN(score4))) ||
              (score3 == score4 && (isNaN(score5) || isNaN(score6))) )  // skip games with invalid scores
          {
            // use (reset to placeholder)
            $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html( team1_placeholder );
            $calc_team1_id.val( '' );
          }
          else
          {
             if( (score1 > score2) ||
                 (score1 == score2 && score3 > score4) ||
                 (score1 == score2 && score3 == score4 && score5 > score6 ))  // team1 wins
             {
                $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html(
                   $tr.find( '.game-team1 .game-team-calc' ).html() );
               $calc_team1_id.val( $game_winner_calc_team1_id.val() );
             }
             else if( (score1 < score2) ||
                      (score1 == score2 && score3 < score4) ||
                      (score1 == score2 && score3 == score4 && score5 < score6 ))  // team2 wins
             {
                $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html(
                   $tr.find( '.game-team2 .game-team-calc' ).html() );
               $calc_team1_id.val( $game_winner_calc_team2_id.val() );
             }
             else  // unknow state - use (reset to placeholder)
             {
                $( '#game'+game_id ).find( '.game-team1 .game-team-calc' ).html( team1_placeholder );
                $calc_team1_id.val( '' );
             }
          }
       }
       else
       {
         alert( 'unbekannte team1_calcrule: ' + team1_calcrule );
       }


       if( team2_calcrule == 'group-winner' )
       {
         var group = groups[ 'g'+ team2_calcvalue ];
         var team  = group[0];
         if( team.played > 0 )
         {
            $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html( team.title_html );
            $calc_team2_id.val( team.team_id );
         }
         else // use (reset to) placeholder
         {
            $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html( team2_placeholder );
            $calc_team2_id.val( '' );
         }
       }
       else if( team2_calcrule == 'group-2nd' )
       {
         var group = groups[ 'g'+ team2_calcvalue ];
         var team  = group[1];
         if( team.played > 0 )
         {
            $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html( team.title_html );
            $calc_team2_id.val( team.team_id );
         }
         else // use (reset to) placeholder
         {
            $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html( team2_placeholder );
            $calc_team2_id.val( '' );
         }
       }
       else if( team2_calcrule == 'game-winner' )
       {
          var $tr = $( '#game'+team2_calcvalue );
          var $score1 = $tr.find( 'input[type=text][data-autofill=score1]');
          var $score2 = $tr.find( 'input[type=text][data-autofill=score2]');
          var $score3 = $tr.find( 'input[type=text][data-autofill=score3]');
          var $score4 = $tr.find( 'input[type=text][data-autofill=score4]');
          var $score5 = $tr.find( 'input[type=text][data-autofill=score5]');
          var $score6 = $tr.find( 'input[type=text][data-autofill=score6]');

          var $game_winner_calc_team1_id = $tr.find( 'input[type=hidden][data-autofill=calcteam1id]');
          var $game_winner_calc_team2_id = $tr.find( 'input[type=hidden][data-autofill=calcteam2id]');

          var score1 = parseInt( $score1.val(), 10 );
          var score2 = parseInt( $score2.val(), 10 );
          var score3 = parseInt( $score3.val(), 10 );
          var score4 = parseInt( $score4.val(), 10 );
          var score5 = parseInt( $score5.val(), 10 );
          var score6 = parseInt( $score6.val(), 10 );

          
          if( (isNaN(score1) || isNaN(score2)) ||
              (score1 == score2 && (isNaN(score3) || isNaN(score4))) ||
              (score3 == score4 && (isNaN(score5) || isNaN(score6))) )  // skip games with invalid scores
          {
            // use (reset to placeholder)
            $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html( team2_placeholder );
            $calc_team2_id.val( '' );
          }
          else
          {
             if( (score1 > score2) ||
                 (score1 == score2 && score3 > score4) ||
                 (score1 == score2 && score3 == score4 && score5 > score6 ))  // team1 wins
             {
                $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html(
                   $tr.find( '.game-team1 .game-team-calc' ).html() );
                $calc_team2_id.val( $game_winner_calc_team1_id.val() );
             }
             else if( (score1 < score2) ||
                      (score1 == score2 && score3 < score4) ||
                      (score1 == score2 && score3 == score4 && score5 < score6 ))  // team2 wins
             {
                $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html(
                   $tr.find( '.game-team2 .game-team-calc' ).html() );
                $calc_team2_id.val( $game_winner_calc_team2_id.val() );
             }
             else  // unknow state - use (reset to placeholder)
             {
                $( '#game'+game_id ).find( '.game-team2 .game-team-calc' ).html( team2_placeholder );
                $calc_team2_id.val( '' );
             }
          }
       }
       else
       {
         alert( 'unbekannte team2_calcrule: ' + team2_calcrule );
       }
    }
    
  } );  // end each game
  
 
   ///////////////////////////////////////////////////////
   // process last game (assume it's the final) to get 1st and 2nd if game fixture is calc(ulated)
 
   $final = $( '.play .tip-score-input' ).last(); 

   var $score1 = $final.find( 'input[type=text][data-autofill=score1]');

   var calc  = $score1.attr( 'data-calc' );
   if( calc == 'true' )
   {
     var $score2 = $final.find( 'input[type=text][data-autofill=score2]');
     var $score3 = $final.find( 'input[type=text][data-autofill=score3]');
     var $score4 = $final.find( 'input[type=text][data-autofill=score4]');
     var $score5 = $final.find( 'input[type=text][data-autofill=score5]');
     var $score6 = $final.find( 'input[type=text][data-autofill=score6]');

     var $calc_team1_id = $final.find( 'input[type=hidden][data-autofill=calcteam1id]');
     var $calc_team2_id = $final.find( 'input[type=hidden][data-autofill=calcteam2id]');

     var score1 = parseInt( $score1.val(), 10 );
     var score2 = parseInt( $score2.val(), 10 );
     var score3 = parseInt( $score3.val(), 10 );
     var score4 = parseInt( $score4.val(), 10 );
     var score5 = parseInt( $score5.val(), 10 );
     var score6 = parseInt( $score6.val(), 10 );

     var $play_team1_id = $( '#play_team1_id' ); // get hidden fields for winning teams for play record 
     var $play_team2_id = $( '#play_team2_id' );

 
     if( (isNaN(score1) || isNaN(score2)) ||
         (score1 == score2 && (isNaN(score3) || isNaN(score4))) ||
         (score3 == score4 && (isNaN(score5) || isNaN(score6))) )  // skip games with invalid scores
     {
        $play_team1_id.val( '' );
        $play_team2_id.val( '' );
     }
     else
     {
        if( (score1 > score2) ||
            (score1 == score2 && score3 > score4) ||
            (score1 == score2 && score3 == score4 && score5 > score6 ))  // team1 wins
        { 
          $play_team1_id.val( $calc_team1_id.val() );
          $play_team2_id.val( $calc_team2_id.val() );
        }
        else if( (score1 < score2) ||
                 (score1 == score2 && score3 < score4) ||
                 (score1 == score2 && score3 == score4 && score5 < score6 ))  // team2 wins
        {
          $play_team1_id.val( $calc_team2_id.val() );
          $play_team2_id.val( $calc_team1_id.val() );
        }
        else  // unknow state - use (reset to placeholder)
        {
          $play_team1_id.val( '' );
          $play_team2_id.val( '' );
        }
     }
   }
} // function recalPlayTips

function autofillPlayTips()
{
  // for each game 
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
  }); // end each game
} // function autofillPlayTips