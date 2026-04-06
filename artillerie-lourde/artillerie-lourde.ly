\version "2.24.1"




\header {
  title = "Artillerie lourde"
  instrument = \markup {"enregistrée à Paris, le 3 novembre, 1944" }
  composer = " Django Reinhardt"
  %arranger = "TODO"
  copyright = "Transcription: Leo McFadden"
  
  
}


  \paper {
  system-system-spacing.basic-distance = 20  % Increased spacing between systems
  score-system-spacing.basic-distance = 25   % Space between title/header and first system
  markup-system-spacing.basic-distance = 18  % Space between text markups and systems
  }






% Toggle variable for showing/hiding analysis circles
showAnalysisCircles = ##t  % Set to ##t to show circles, ##f to hide them

% Revised redCircle function
redCircle = {
  #(if showAnalysisCircles
     #{
      % \once \override NoteHead.color = #red
       \once \override NoteHead.layer = #-1
       \once \override NoteHead.stencil = #(lambda (grob)
         (let* ((stil (ly:note-head::print grob))
                (lg (ly:grob-property grob 'duration-log))
                (stem (ly:grob-object grob 'stem))
                (is-whole? (= lg 0))
                (stem-dir (if stem 
                             (ly:grob-property stem 'direction) 
                             0)))
           (ly:stencil-add
             stil
             (grob-interpret-markup grob
               (markup
                 #:with-color red
                 #:translate (cons 0.7 0.0)
                 #:draw-circle 1.0 0.2 #f)))))
     #}
     #{ #})
}

% Revised circleNote function
circleNote = 
#(define-music-function (note) (ly:music?)
  (if showAnalysisCircles
      #{
        \once \override NoteHead.color = #black
        \once \override NoteHead.stencil = 
        #(lambda (grob)
          (let* ((stil (ly:note-head::print grob)))
            (ly:stencil-add
              stil
              (grob-interpret-markup grob
                (markup
                  #:with-color blue
                     #:translate (cons 0.7 0.0)
                 #:draw-circle 1.0 0.2 #f)))))
        #note
      #}
      note))










global = {

  \key c \major
  \time 4/4
}



 breaks=  \new Voice { \partial 4. s4.
               
 \repeat unfold 4   {s1 *  4 \break} 
    
 
     }

riff =  \relative c {
  
  c2 r4 c8 ees | %m1
  r8 c a4-.  g8 g b4 |%m2
  
}


figureOne = \relative c'' {
    \override NoteHead.style = #'cross
    r2 a4  r4 | 
    a4. a8 r2 | 
  
  
}


figureTwo = \relative c'' { 
  
      \override NoteHead.style = #'cross
      
      g1~ | 
      g2.  8 8~ | 
  
}

figureThree = \relative c' {
     \override NoteHead.style = #'cross
     r4 g'8 g~ g4 r4 
     s1
  
  
}
 
firstA = \relative c { \global \clef "treble_8"
                       
                             \tempo \markup {
    Swing
    \hspace #0.4
    \rhythm { 8[ 8] } = \rhythm { \tuplet 3/2 { 4 8 } }
  }

  <<                     
  \new Voice { \voiceTwo                      
                       
  \partial 4. g8 b4-. | %m0
\repeat unfold 3     {
  \riff
}
c2 r2  | %m8
r2. g4 |%m9
b8-- c-- r2  c8 ees | %m9
8 c a4 g8 8 b4 %m10
\repeat unfold 2 {\riff}
c2 r4  g4 |%m9
b8-- c~--  c2 r4 

  }
  \new Voice  {   \partial 4. s4.
   s1*6               
                  
                  \voiceOne r2.^ \markup{\italic"trompettes :"} g'' 4 
   b8-- c--~ c4 r2 %m8
   s1 *2 %m9+10
   \repeat unfold 2 {\figureOne }
                 

 }
  
                % Voice for line breaks (invisible)
        \new Voice {
          \voiceThree  % Lower voice number to make sure it's underneath
         \partial 4. s4.
     \repeat unfold 4   { s1 * 4 \break}
     
        }
     %\breaks
  

  
   
  >>  
  \oneVoice
                       
                       
}


bridge = {
<<
\new Voice {  \voiceOne 
 \repeat unfold 3 {\figureTwo}
  
  g'2 r8 8-> 8-> 8-> 

}

\new Voice { \voiceTwo
  s1 *4 \break
  s1*3
    r8 g f4 e d8 c~  \break
  
}
  
>>  
}

lastA = \relative c' {
  <<
    
    \new Voice { \voiceOne
       s1 s2. s4^\markup{\italic"blue note"}         
     \repeat unfold 3{ \figureThree} 
                 
         
     }
                 
    
    
    
    
  \new Voice { \voiceTwo 
\repeat unfold 3 {\riff} 
c,2 r4 g |
b8-- c-- r2.  |


  }

\new Voice { \voiceThree
  
    s1 *4 \break
  
}
>>

}






% Fixed chord sections
 intro = \chordmode {
  
 
}

aSection = \chordmode {
 
}

bSection = \chordmode {




}






\score {


   <<
     

        
%               \new Staff = "ossia" \with {
%     \remove Time_signature_engraver
%     \hide Clef
%     \magnifyStaff #2/3
%   }
%   { \stopStaff s1*6 }

%\new ChordNames {\intro}

\new Staff = "melody"  {\firstA  % \with {    instrumentName = "Thème"       }

  
     \bridge
     
\lastA

}

  
 
  >>
  

    
 

  
  
  \layout {}
  \midi {}
}

  
 








