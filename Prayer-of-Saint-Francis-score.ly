\version "2.24.1"

\include "prayer-st-francis-vln.ly"
\include "prayer-st-francis-cello.ly"



\header {
  title = "Prayer of Saint Francis"
}



\score {


    <<


\new Staff \with {
  instrumentName = "violin"
  shortInstrumentName = "vln."
  % \overide RemoveEmptyStaves 
  % I need to figure out a way to get this working
\override Staff.RemoveEmptyStaves = ##f %this isn't working- would be nice to know why 
}
 
        <<

  \violin 
   
        >>

\new Staff \with {
  instrumentName = "cello"
  shortInstrumentName = "vc"
  % \overide RemoveEmptyStaves 
  % I need to figure out a way to get this working
%\override Staff.RemoveEmptyStaves = ##f %this isn't working- would be nice to know why 
}
 
        <<
  
  \cello
   
    
        >>

  
     >>	
                  

   \layout {

  short-indent = 2\cm
  indent = 3\cm
}
 
} 
 
\score {
  \unfoldRepeats {
  <<


\new Staff \with {
  instrumentName = "violin"
  shortInstrumentName = "vln."
  % \overide RemoveEmptyStaves 
  % I need to figure out a way to get this working
\override Staff.RemoveEmptyStaves = ##f %this isn't working- would be nice to know why 
}
 

        <<
  

  \violin 
  
  
    
        >>

\new Staff \with {
  instrumentName = "cello"
  shortInstrumentName = "vc"
  % \overide RemoveEmptyStaves 
  % I need to figure out a way to get this working
%\override Staff.RemoveEmptyStaves = ##f %this isn't working- would be nice to know why 
}
 

        <<
  

  \cello
  
  
    
        >>



  
     >>	
                  

  }
  \midi { }
}