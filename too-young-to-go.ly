\version "2.24.1"




\header {
  title = "Too Young to Go Steady"
  instrument = \markup { "de l'album" \italic "This Time It's Love"}
  composer = "Jimmy McHugh"
  arranger = "Harold Adamson"
  copyright = "Performance du Kurt Elling"

  
}

% Toggle variables for different analysis layers 
showAnalysisOne = ##t  % First layer: notes against basic blues
showAnalysisTwo = ##t   % Second layer: notes against alternate changes



% First layer: red circles (notes that don't seem to belong to the written changes)
redCircle = {
  #(if showAnalysisOne
     #{
       \once \override NoteHead.layer = #-1
       \once \override NoteHead.stencil = #(lambda (grob)
         (let* ((stil (ly:note-head::print grob)))
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



% Red asterisk above measure (for analysis layer one)
asteriskOne = 
#(define-music-function () ()
  (if showAnalysisOne
      #{
        ^\markup { \with-color #red \fontsize #6 "*" }
      #}
      #{ #}))










% Toggle variable for showing/hiding analysis circles
%showAnalysisCircles = ##t  % Set to ##t to show circles, ##f to hide them














global = {

  \key c \major
  \time 4/4
}






pianoRH = \relative c'' {   \global \clef "treble" 
  
  \partial 4 \tuplet 3/2 {r8 c4  } |
  g'2 r8 c,  \tuplet 3/2 {g'8 f f~  } |
  
  f2 r8 c   \tuplet 3/2  {f8 ees ees~  } | 
  ees2 r8 c ees f  | 
  g4.  8 <  a, c e>2  |
  
  
           }
  
  


pianoLH =  \relative c { \global \clef "bass"
  
  \partial 4 r4 | 
  
  r8 <aes' c ees g>8~ q2  r4 |
  r8 < aes c d  f g >8~ q2 r4 |
    r8 < f c'  f g aes >8~ q2 r4 |
   < b d e g >2  <a c f >2 |   
  
  
}
  
  
  
  contrebasseIntro = \relative c' { \clef "treble_8" \partial 4 s4
   r8 aes~ aes2 r4 |
      r8 g~ g2 r4 | 
     r8 f~ f2 r4 | \clef "bass_8"
e2 d4 g, \bar "||"| \break

    
    
    
  }
  

contrebasse = { 
       \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
 
 <<
     % Voice for  asterisk Placement (invisible)
        \new Voice {
          \voiceTwo  % Lower voice number to make sure it's underneath
          \partial 4 s4
          s1 * 4 
          s1 * 4 
          s1 * 2 s1\asteriskOne s2\asteriskOne s2\asteriskOne 
          s1 * 2 | s2 s2\asteriskOne | s2 s2\asteriskOne  | 
          s2 s2\asteriskOne | s1 | s2 s2\asteriskOne | s1 |
          s1 | s2\asteriskOne s4\asteriskOne s4\asteriskOne | s1 * 2 | 
          s1 * 2 |  s1\asteriskOne | \repeat unfold 2 {s2\asteriskOne} 
          s1 * 2 | s2\asteriskOne s2 | s2 s4\asteriskOne s4\asteriskOne | 
          
          
       
        }
  
 
 
 
 
  \global  \clef "bass_8"   \relative c
 {   
  \sectionLabel \markup { \rounded-box { A } }
  \partial 4 r4
  R1*7 |


r2. g,4 | 
  \sectionLabel \markup { \rounded-box { A' } }
c2 a | 
d2. g,4 |
\redCircle e2 a |
\redCircle fis \redCircle f |
e a |
d2 d4  g,4~ | 
 \redCircle g4\redCircle g2\redCircle g4  | 
c2 \redCircle b    | 


 
  \sectionLabel \markup{\rounded-box{B}}
  e,2 \redCircle cis' |  
  fis, b |
  e, \redCircle g | 
  \redCircle fis4~ \tuplet 3/2 { fis8 \redCircle fis' c } b2 | %note there is an error here in the real book chart. 
   e,1  | 
   \redCircle f2\redCircle fis4\redCircle b | 
   e,2  a4~ \tuplet 3/2 {a8 cis e }
   d2 g, |
   
    \sectionLabel \markup { \rounded-box { A' } }
c2 a | 
d2 g,4 f |
e2 a |
fis f |
e a |
d2 d4  g,4~ | 
 g4 g2 g4~  | 
g g8^\markup{binaire} c d4 g  \bar "|."    | 
 

}

 >>
}




% Fixed chord sections
intro = \chordmode {
  
  \partial 4 r4 
  aes1:maj7 | % check this intro 
  aes:maj13/g |
 f:m9 		|
   e2:m d4:m g:7 |
}

aSection = \chordmode {
 \partial 4 r4
 c2:maj7 a:m7 |
  d:m7 g:7 |
  c:maj7 a:m7 |
  d:m7 g:7 |
  e:m7 a:m7 |
  d:m7 e:7  |
  a:m7 d:7 |
  d:m7 g:7 |
}


aoneSection = \chordmode { 
 c2:maj7 a:m7 |
  d:m7 g:7 |
  c:maj7 a:m7 |
  d:7 ees:dim7 |
  e:m7 a:m7 |
  d:m7 g:7  |
  c1:maj7 |
  q |
  
  
}




bSection = \chordmode {
  e:m7 |
  fis2:m7.5- b:7.9- |
  e1:m7 |
  f2:m7.5- b:7 | % Hobgood plays B7b13 -> Em11 here (the g leads to the A) 
    e1:m7 |
  fis2:m7.5- b:7 |
  e2:m7.5- a:7.9- |
  d2:7   g:7 |
}


cSection = \chordmode {
  c1:6/g |
  fis2:m7.5-  f:m6 |
  e:m7 a:m7 |
  d1:9sus4 |
  c2:9 a:m7 |
  d:m7 g:7.9- |
  c1:maj7  | 
   g:7 | 
  
  
  
}
  
  
  coneSection = \chordmode {
  c1:6/g |
  fis2:m7.5-  f:m6 |
  e:m7 a:m7 |
  d1:9sus4 |
  c2:9 a:m7 |
  d:m7 g:7.9- |
  c1:maj7  | 
   s1 | 
  
  
  
}
  
  
  
  
  \paper {
  system-system-spacing.basic-distance = 20  % Increased spacing between systems
  score-system-spacing.basic-distance = 25   % Space between title/header and first system
  markup-system-spacing.basic-distance = 18  % Space between text markups and systems
}
%   {
%   bes:maj7 a:m7 |
%   d:m7 a:m7 |
%   f:maj7 d:m7 |
%   aes:maj7 aes:maj7 |
%   g:7 e:m7 |
% }

% intro = \relative {
% 
%   \chordmode {
%   s1 | 
%   s1 |
%   }
% }
% 
% aSection = \relative {
%   
%   \chordmode {
%   {c2 a:m7 |
%   d:m7 g:m9|
%   c
%   }
% }
alternateChords = \chordmode {  
  
    
          %\voiceTwo  % Lower voice number to make sure it's underneath
          \partial 4 s4
          s1 * 4 
          s1 * 4 
          s1 * 2 |
          e1:m7 |
          fis2:m7.5- f2:m6 |
          s1  |
          a4:m11/d d4:13 d4:m9  g4:11.13 |
          c2:6/g f2:maj7/g
          s2 b2:7 | s2 cis:m7.5-  | fis2:min7.5-.11+ b:7.9+ | s2 g2:maj7 | s1 |
        s1 |
        f2:maj9 fis4:min7.5- b:7 |  e2:m9  s2  | d:9 g:sus4.7  |  %F# half diminished always has B in sop, could be see as D7b13
        s1 * 2 | e2:m7 a2:m9 | fis:min7.5- f:m7 |
        s1 * 2 | f1:/g | 
        s2 d4:m7 g4:7
        
    
       
                          




} 








%First score block for just the piano right hand
% \score {
%   
%   <<
% \new ChordNames {\intro}
%   \new PianoStaff \with { instrumentName = "Piano" } <<
%     \new Staff = "upper"       \pianoRH
%     
%    
%     \new Staff = "lower"        
%       \pianoLH
%           
%   
%   
%   
%     
%   >>
% \new Staff = "bass" \with { instrumentName = "basse" }  \contrebasseIntro
% 
%   >>
%   
% 
%   \layout {}
%   % No \midi {} here to avoid duplicate MIDI files
% }


%\markup { \vspace #2 }
%\markup { \bold \large "Contrebasse - performance de Carson Smith" }
%\markup { \vspace #1 }


\score {
 
 
 
 
 
<<
    
    
    %%test chord names for corrected chords (need spectial markup) 
%      \new ChordNames { 
%  \alternate
%    } 
    
#(if showAnalysisTwo
    #{
      \new ChordNames \with {
      \override ChordName.color = #red
      
      }
   
   <<
   { 
        \alternateChords
      } 
                % Ajoute cette nouvelle voix :
\new Dynamics {
  \partial 4  s4 s1*30  % ajuste le nombre pour arriver à la bonne mesure
  s2 s2^\markup {  \upright { "des accords du style faux-bourdon en " \italic "do" "ionien et lydien" } }
}
   >>
       #}
    #{ #})
    
    
    
    
    % Regular chordnames
    \new ChordNames {
  
      \aSection
      \aoneSection

      \bSection
      \aoneSection
      
      % Any additional sections
    }
<< 
<<
  %\new ChordNames \myChords
  \new Staff = "chordsInNotes"
  <<

  {
     \aSection
      \aoneSection

      \bSection
      \aoneSection}
>>
>>            
     
    % Bass part with line breaks properly nested
    \new Staff = "bass" {
      <<
        % Voice for line breaks (invisible)
        \new Voice {
          \voiceTwo  % Lower voice number to make sure it's underneath
          \partial 4 s4
          s1 * 4 \break
          s1 * 4 \break
          s1 * 4 \break
          \repeat unfold 5 {s1 * 4 \break}
        }
        
        % Main bass voice
        \new Voice {
    % Higher voice number to ensure it's on top
          \contrebasse 
        }
      >>
    }
  >>
>>
  
  \layout {}
  \midi {}
}