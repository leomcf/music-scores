\version "2.24.1"

\include "roman_numeral_analysis_tool.ily"

showAnalysisAdvanced = ##t




\header {
  title = "I Could Write A Book"
  composer = "Richard Rodgers"
  arranger = "Lorenz  Hart"
  copyright = "correction de Leo McFadden"

  
}

% Toggle variables for different analysis layers
showAnalysisOne = ##t  % First layer: notes against basic blues
showAnalysisTwo = ##t  % Second layer: notes against alternate changes
showDegreeBoxes = ##t% Colored boxes: I/i=red  V=blue  IV=green  iii=orange





advancedAnalysis =
#(define-music-function (advanced plain) (ly:music? ly:music?)
  (if showAnalysisAdvanced
    #{
     % \override LyricText.color = #(x11-color 'orange)
      \override LyricText.font-series = #'bold
      #advanced
      \revert LyricText.color
      \revert LyricText.font-series
    #}
    #{
      \override LyricText.color = #black
      \override LyricText.font-series = #'normal
      #plain
      \revert LyricText.color
      \revert LyricText.font-series
    #}))



% First layer: red circles (notes that don't seem to belong to the written changes)
redCircle = {
  #(if advancedAnalysis
     #{
       \once \override NoteHead.layer = #-1
       \once \override NoteHead.stencil = #(lambda (grob)
         (let* ((stil (ly:note-head::print grob)))
           (ly:stencil-add
             stil
             (grob-interpret-markup grob
               (markup
                 #:with-color red
                 #:translate (cons 0.75 0.0)
                 #:draw-circle 1.1 0.2 #f)))))
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


startPat = {
  \improvisationOn
  \omit Stem
}
stopPat = {
  \improvisationOff
  \undo \omit Stem
}

% Markup command: wraps content in a colored box when showDegreeBoxes = ##t
% Usage: \markup \degreeBox #red { I }   \markup \degreeBox #blue { V }
%        \markup \degreeBox #(x11-color 'green4) { IV }
%        \markup \degreeBox #(x11-color 'orange) { iii }
#(define-markup-command (degreeBox layout props color content)
  (color? markup?)
  (if showDegreeBoxes
      (interpret-markup layout props
        (markup #:with-color color #:box content))
      (interpret-markup layout props content)))







% Toggle variable for showing/hiding analysis circles
%showAnalysisCircles = ##t  % Set to ##t to show circles, ##f to hide them




global = {

  \key c \major
  \time 4/4
}






melody = \relative c'  {   \clef "treble" 
  
\partial 2   e4 f   |
   \repeat unfold 2 { 
  
  \sectionLabel \markup { \rounded-box { A } }

g2 b2  | %1
  a4 g  e d | %2
  e1~		| %m3
  e4 g e d | %4
  e g e d |  %m5
  e c'2 e,4 | %m6
  g1~ 	| %m7
  g2	 a4 b  \bar "||" %m8
 \set Score.voltaSpannerDuration = #(ly:make-moment 1/1)
   \alternative {
  \volta 1 { 
  
   \sectionLabel \markup { \rounded-box { B } }c2 	c 	| %m9
  c4 d2 b4 | %10
  a2	a 	| %m11
  g e4 \redCircle fis	| %m12
  g2 g 	| %m13
  g4 a2  \redCircle fis4 | %14
  g1~		| %m15
  g4 r4 e f \bar"||"   %m16 
  
    }
    
      \volta 2 {
   \sectionLabel \markup { \rounded-box { C } }
   c'2 	c 	| %m25
  c4 d2 b4 | %26
 bes2 bes	| %m27
a2 g4 f | %m28
  e2 e 	| %m29
  d4 c'2 b4  | %30
  c1		| %m31
  R1    \bar "|."  %m32 

    }
    
   }
    
  } 

}
  
 


phrasingMelodic = {
  \startPat
  \partial 2 c4( c |
  c4 c c c | %m1
  c4 c c c | %m2
  c4) c c c | %m3
  c4 c( c c | %m4
  c4 c c c | %m5
  c4 c c c | %m6
  c4) c c c | %m7
  c4 c c( c | %m8
  c4 c c c | %m9
  c4 c c c | %m10
  c4 c c c | %m11
  c4) c c( c | %m12
  c4 c c c | %m13
  c4 c c c | %m14
  c4) c c c | %m15
  c4 c c( c | %m16
  c4 c c c | %m17
  c4 c c c | %m18
  c4) c c c | %m19
  c4 c( c c | %m20
  c4 c c c | %m21
  c4 c c c | %m22
  c4) c c c | %m23
  c4 c c( c | %m24
  c4 c c c | %m25
  c4 c c c | %m26
  c4 c c c | %m27
  c4) c c( c | %m28
  c4 c c c | %m29
  c4 c c c | %m30
  c4) c c c | %m31
  c4 c c c | %m32  \bar ".|"
}


phrasingHarmonic = {
  \startPat
  \partial 2 c4 c |
  \slurDotted
  c4( c c c | %m1
  c4 c c c | %m2
  c4)( c c c | %m3
  c4 c c c | %m4
  c4)( c c c | %m5
  c4 c c c | %m6
  c4)( c c c | %m7
  c4 c c c | %m8
  c4)( c c c | %m9
  c4 c c) c | %m10
  c4( c c c | %m11
  c4) c c c | %m12
  c4( c c c | %m13
  c4 c c c | %m14
  c4)( c c c | %m15
  c4 c c c | %m16
  c4)( c c c | %m17
  c4 c c c | %m18
  c4)( c c c | %m19
  c4 c c c | %m20
  c4)( c c c | %m21
  c4 c c c | %m22
  c4)( c c c | %m23
  c4 c c c | %m24
  c4)( c c c | %m25
  c4 c c) c | %m26
  c4( c c c | %m27
  c4) c c( c | %m28
  c4 c c c | %m29
  c4 c c c | %m30
  c4) \stopPat s2. | %m31
  s1 | %m32  \bar ".|"
  
}






harmonicR = {
  \partial 2 c2 |
\repeat unfold 11 {c2 c2} 
c2 c4 c4 % measure 12 harmonic rhythm
\repeat unfold 19 { c2 c2 }
  c2 c2
}



mainChords = \chordmode {

  \partial 2 s2 |
       \repeat unfold 2 {
  c2:maj7 a:m7 | %m1
  d:m7 	g:7 | %m2 m1 & 2 anatole 
    c2:maj7 a:m7 | %m3
  d:m7 	g:7 | %m4  % m3 & 4 anatole
  c:maj7 d:m7 | %m5
  e:m7 	a:m7 | %m6
  d1:m11 	          | %m7
  g2:7 	g:7/f | %m8  % m5- 8 anatole (durations doublées par rapport aux exemples précedents) 
     }
     
     \alternative {
       
       \volta 1 {
         
         c2:6/e  ees:dim7 | %m9  
         d:m7  	g:7 	| %m10
         a:m7 	d:7.9- | %m11
         g:6		cis4:m7.5-  d/c	| %m12
         g2/b  	bes:dim7 | %m13
         a:m7 	d:7.9-	| %m14
         d1:m11 	| %m15   p.43  (also measure 26-27 below) « Il faut enfin ajouter qu'il arrive que le substitué subsiste à côté du substitut, par exemple dans l'exemple suivant : Am7 - D7 - Dm7 - G7 - C. Le substitué Dm7 reste après son substitut harmonique (D7). Dans ce cas, cela permet de conserver une carrure régulière si le rythme harmonique est de deux accords par mesure. »
         g:7.9- 	| %m16
                  
       }
       
       \volta 2 {
            c2:6/e  ees:dim7 | %m25
         d2:m7 	g:7 	| %m26
         g:m7 	c:7 	| %m27    %%p43  « Il faut enfin ajouter qu'il arrive que le substitué subsiste à côté du substitut, par exemple dans l'exemple suivant : Am7 - D7 - Dm7 - G7 - C. Le substitué Dm7 reste après son substitut harmonique (D7). Dans ce cas, cela permet de conserver une carrure régulière si le rythme harmonique est de deux accords par mesure. »
        e:m7		a:7.9- | %m29
        d:m7		g:7.9-| %m30
        c1:6			
         
         
       }
       
       
       
       
     }

}


anatoleUp = 
{ 
  b''2 c |
  c b    |  %%%don't touch this 
  
  }
  
  
 anatoleMid = 
 {
  e'2 g | 
  f	f |  % don't add to this. 
  
  
}

soprano = \relative c  {
  
  \global 
  \clef"treble" 
  \partial 2 r2 | 
  
  \repeat unfold 2 {
    
  \repeat unfold 2 { \anatoleUp }  
  
  b2 c 	| %m5
  d c 		| %m6
  c1 		| %m7
  b2  b2		|  %8
  
  
  } %A section ends here. 
      
  \alternative{
  
  
  \volta 1   { 
    c2 c	 | % m9 ré double bémol nommé do   
    c 	b	|  %m10
    c 	c  	| %m11
    b2 b4 a  | %m12
    d2  des | %m13 
    c    c	| % %m14
    c1 	| %m15
    b		| %m16
      }
    
  \volta 2 {
  
  c2 c	| %m25
  c  b		| %m26
  bes  bes	| %m27
  a 	aes	| %m28
  g 	g	| %m29
  f 	f	| %m30
  e1		| %m31
  R1		| %m32	
  
  
       }
  
    }

}
  
  
  
  alto = \relative c {
 \global 
 \clef"treble"
 \partial 2 r2 
 
 \repeat unfold 2 {
   
   \repeat unfold 2 { \anatoleMid }
   
   e2 f | %m5
   g2 g | %m6
   \redCircle g1  | %m7
    g2   g2		|
   
   
     } %end of A section
     
   
   \alternative{
   
   \volta 1 {
      
      g ges      | %m9
      f   f	   | %m10
      g  fis	   | %m11
      e  e4 fis | %m12
      g2 g	|  %m13 second g is really a la double bémol 
      g2  fis	| %m14
      g1	| %m15
      f1 	| %m16
           
      }
    
    \volta 2 {
      
      g2  ges   | %m25
      f 		f  | %m26
      f		e | %m27
      e 	d | %m28
      d 	cis | %m29
      c!2 	b  | %m30
      a1	| %m31
      R1	| %m32
      
           }
    
      }
  
  }



bassLine = \relative c {
  \global
  \clef "bass"
  \partial 2 r2 |
  \repeat unfold 2 {
    % A section (mm. 1-8)
    c2  a2   |    % m1:  Cmaj7  Am7
    d2  g2   |    % m2:  Dm7    G7
    c,2 a2   |    % m3:  Cmaj7  Am7
    d2  g2   |    % m4:  Dm7    G7
    c,2 d2   |    % m5:  Cmaj7  Dm7
    e2  a2   |    % m6:  Em7    Am7
    d,1      |    % m7:  Dm11
    g2  f2   |    % m8:  G7     G7/F (slash → F bass)
    \alternative {
      \volta 1 {
        % B section (mm. 9-16)
        e2  ees2       |    % m9:  C6/E (slash → E bass)  Edim7
        d2  g2       |    % m10: Dm7    G7
        a2  d,2      |    % m11: Am7    D7b9
        g2  cis,4 c4 |    % m12: G6  C#m7b5  D/C (slash → C bass)
        b2  bes2     |    % m13: G/B (slash → B bass)  Bbdim7
        a2  d2       |    % m14: Am7    D7b9
        d1           |    % m15: Dm11
        g,1          |    % m16: G7b9 — G2, anchors second-pass A to start on C3
      }
      \volta 2 {
        % C section (mm. 25-32)
        e'2  ees2   |    % m25: C6/E (slash → E bass)  Edim7
        d2  g2   |    % m26: Dm7    G7
        g2  c,2  |    % m27: Gm7    C7
        f2  bes2 |    % m28: Fmaj7  Bb7
        e,2 a2   |    % m29: Em7    A7b9
        d,2 g2   |    % m30: Dm7    G7b9
        c,1      |    % m31: C6
        R1 \bar "|."  % m32
      }
    }
  }
}



%%% Roman numeral analysis (attached to phrasing voice)
%%% \rN retained only where special notation is used (o, h, f-prefix, concat)
%%% Boxes: \degreeBox #red { I }  #blue "V"  #(x11-color 'green4) "IV"  #(x11-color 'orange) "iii"
%%% Trump rule: when advancedAnalysis or analysisSol is active at a position,
%%%   only box within those variables — see m11-12 (V) and m27-28 (IV) below
analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \set stanza = \markup \rounded-box \concat{ { \italic "do" "  : " } }

  %% A section (mm. 1-8) — appears twice (unfold 2 in other voices)
  %anacrusis
  \skip 2 |
  \markup \degreeBox #red { I }  \markup { vi }  |
  \markup { ii }  \markup \degreeBox #blue { V }  | %m1-2
  \markup \degreeBox #red { I }  \markup { vi }  \markup { ii }  \markup \degreeBox #blue { V }  | %m3-4
  \markup \degreeBox #red { I }  \markup { ii }  \markup \degreeBox #(x11-color 'orange) { iii }  \markup { vi }  | %m5-6
  \markup { ii }  \skip 2  \markup \degreeBox #blue { V }  \skip 2  | %m7-8

  %% B section (mm. 9-16)
  \markup \degreeBox #red { I }
  \advancedAnalysis
  { \skip 2 }
  { \markup \rN { fiii o } }
  \markup { ii }  \markup \degreeBox #blue { V }  | %m9-10

  \markup { vi }  \markup { IIx } %% substitution harmonique 
  \advancedAnalysis
  { %% advanced (sol context) — analysisSol boxes the V here, so omit V box
    \set stanza = \markup \rounded-box { \concat { \italic "sol" " :" } }
    \markup \degreeBox #red { I }
    \markup { IIx } % substitution harmonique
    \markup "V"
  }
  { %% plain — analysisSol not shown, so box V here
    \markup \degreeBox #blue { V }
    \markup \rN { si h }
    \markup { IIx } % substitution harmonique
  } %m11-12

  %m11-12: vi(=ii/G) V7/G | I in G
  \advancedAnalysis {
    \markup \degreeBox #red { I }  \markup \rN { fvii o }  \markup { ii }  \markup \degreeBox #blue { V }  | %m13-14
    \markup { vm }  \skip 2
  }
  {
    \markup \degreeBox #blue { V }  \markup \rN { fvii o }  \markup { vi }  \markup { IIx }  | %m13-14 % substitution harmonique pp. 42-43 cours harmonie EAD %%% c'est l'infrastructure de l'accord qui change
    \markup { ii }  \skip 2  | %m15
  }
    \set stanza = \markup \rounded-box { \concat { \italic "do" " :" } }
  \markup \degreeBox #blue { V }  \skip 2 | %anacrusis (return to A)
  \markup \degreeBox #red { I }  \markup { vi }  |
  \markup { ii }  \markup \degreeBox #blue { V }  | %m1-2
  \markup \degreeBox #red { I }  \markup { vi }  \markup { ii }  \markup \degreeBox #blue { V }  | %m3-4
  \markup \degreeBox #red { I }  \markup { ii }  \markup \degreeBox #(x11-color 'orange) { iii }  \markup { vi }  | %m5-6
  \markup { ii }  \skip 2  \markup \degreeBox #blue { V }  \skip 2  | %m7-8

  %% C section (mm. 25-32)
  \markup \degreeBox #red { I }
  \advancedAnalysis { \markup { VIx } } %sub harmonique
  { \markup \rN { iii o } }
  \markup { ii }  \markup \degreeBox #blue { V }  | %m25-26

  %% m27-28: analysisSol (fa context) is active here when advanced is on
  %%   → box IV only when analysisSol is NOT showing (plain mode)
  \advancedAnalysis
  { \markup { vm }  \markup { Ix }  \markup \degreeBox #green { IV }  \markup \concat { \rN { fVI } "x" }  | } %sub harmonique
  { \markup { vm }  \markup { Ix }  \markup \degreeBox #(x11-color 'green4) { IV }  \markup \concat { \rN { fVI } "x" }  | } %m27-28     % sub harmonique

  \markup \degreeBox #(x11-color 'orange) { iii }  \markup { VIx }  \markup { ii }  \markup \degreeBox #blue { V }  | %m29-30 %sub harmonique 
  \markup \degreeBox #red { I }  \skip 2  | %m31-32
}


%%% Secondary analysis line — modulation to sol (G major) at m11
%%% Skips 21 half-notes (= pickup + m1–10) then shows ii V I in G
%%% Trump rule: V at m11 and V/I at m27-28 (fa) are boxed HERE, not in analysis
analysisSol = \lyricmode {
   % \override LyricText.color = #(x11-color 'orange)
    \override LyricText.font-series = #'bold
    \override LyricText.self-alignment-X = #-0.6
  \skip 2
  \repeat unfold 18 \skip 2   %% advance to m9

  \skip 2 

  \set stanza = \markup \rounded-box { \concat { \italic "sol" " :" } }
  \markup {ii}\markup \degreeBox #blue { V }   %% m11: V of G — boxed here, not in analysis
\skip
  \repeat unfold 4 \skip 2

  \repeat unfold 6 \skip 2 %% this spacer not working
  \set stanza = \markup \rounded-box { \concat { \italic "do" " :" } }
  \markup { ii }
  \repeat unfold 23 \skip 2   %% advance to m27

  \set stanza = \markup \rounded-box { \concat { \italic "fa" " :" } }
  \markup { ii }  \markup \degreeBox #blue { V }  \markup \degreeBox #red { I }  \markup \degreeBox #green { IVx }
  %% m27-28: V and I boxed here; analysis m27-28 IV box suppressed (trump rule)
}



  
  

    
    
    
  

%  
%  
%  
%  
%   \global  \clef "bass_8"   \relative c
%  {   
%   \sectionLabel \markup { \rounded-box { A } }
%   \partial 4 r4
%   R1*7 |
% 
% 
% r2. g,4 | 
%   \sectionLabel \markup { \rounded-box { A' } }
% c2 a | 
% d2. g,4 |
% \redCircle e2 a |
% \redCircle fis \redCircle f |
% e a |
% d2 d4  g,4~ | 
%  \redCircle g4\redCircle g2\redCircle g4  | 
% c2 \redCircle b    | 
% 
% 
%  
%   \sectionLabel \markup{\rounded-box{B}}
%   e,2 \redCircle cis' |  
%   fis, b |
%   e, \redCircle g | 
%   \redCircle fis4~ \tuplet 3/2 { fis8 \redCircle fis' c } b2 | %note there is an error here in the real book chart. 
%    e,1  | 
%    \redCircle f2\redCircle fis4\redCircle b | 
%    e,2  a4~ \tuplet 3/2 {a8 cis e }
%    d2 g, |
%    
%     \sectionLabel \markup { \rounded-box { A' } }
% c2 a | 
% d2 g,4 f |
% e2 a |
% fis f |
% e a |
% d2 d4  g,4~ | 
%  g4 g2 g4~  | 
% g g8^\markup{binaire} c d4 g  \bar "|."    | 
%  
% 
% }
% 
%  >>
% }
% 
% 
% 
% 
% % Fixed chord sections
% intro = \chordmode {
%   
%   \partial 4 r4 
%   aes1:maj7 | % check this intro 
%   aes:maj13/g |
%  f:m9 		|
%    e2:m d4:m g:7 |
% }
% 
% aSection = \chordmode {
%  \partial 4 r4
%  c2:maj7 a:m7 |
%   d:m7 g:7 |
%   c:maj7 a:m7 |
%   d:m7 g:7 |
%   e:m7 a:m7 |
%   d:m7 e:7  |
%   a:m7 d:7 |
%   d:m7 g:7 |
% }
% 
% 
% aoneSection = \chordmode { 
%  c2:maj7 a:m7 |
%   d:m7 g:7 |
%   c:maj7 a:m7 |
%   d:7 ees:dim7 |
%   e:m7 a:m7 |
%   d:m7 g:7  |
%   c1:maj7 |
%   q |
%   
%   
% }
% 
% 
% 
% 
% bSection = \chordmode {
%   e:m7 |
%   fis2:m7.5- b:7.9- |
%   e1:m7 |
%   f2:m7.5- b:7 | % Hobgood plays B7b13 -> Em11 here (the g leads to the A) 
%     e1:m7 |
%   fis2:m7.5- b:7 |
%   e2:m7.5- a:7.9- |
%   d2:7   g:7 |
% }
% 
% 
% cSection = \chordmode {
%   c1:6/g |
%   fis2:m7.5-  f:m6 |
%   e:m7 a:m7 |
%   d1:9sus4 |
%   c2:9 a:m7 |
%   d:m7 g:7.9- |
%   c1:maj7  | 
%    g:7 | 
%   
%   
%   
% }
%   
%   
%   coneSection = \chordmode {
%   c1:6/g |
%   fis2:m7.5-  f:m6 |
%   e:m7 a:m7 |
%   d1:9sus4 |
%   c2:9 a:m7 |
%   d:m7 g:7.9- |
%   c1:maj7  | 
%    s1 | 
%   
%   
%   
% }
%   
%   
  
  
  \paper {
    indent = 20
  system-system-spacing.basic-distance = 15  % Increased spacing between systems
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
% alternateChords = \chordmode {  
%   
%     
%           %\voiceTwo  % Lower voice number to make sure it's underneath
%           \partial 4 s4
%           s1 * 4 
%           s1 * 4 
%           s1 * 2 |
%           e1:m7 |
%           fis2:m7.5- f2:m6 |
%           s1  |
%           a4:m11/d d4:13 d4:m9  g4:11.13 |
%           c2:6/g f2:maj7/g
%           s2 b2:7 | s2 cis:m7.5-  | fis2:min7.5-.11+ b:7.9+ | s2 g2:maj7 | fis:m7.5- s2 |
%         s1 |
%         f2:maj9 fis4:min7.5- b:7 |  e2:m9  s2  | d:9 g:sus4.7  |  %F# half diminished always has B in sop, could be see as D7b13
%         s1 * 2 | e2:m7 a2:m9 | fis:min7.5- f:m7 |
%         s1 * 2 | f1:/g | 
%         s2 d4:m7 g4:7
%         
%     
%        
%                           
% 
% 
% 
% 
% } 



  \layout {
%       \Score
%     \override StaffGrouper.staff-staff-spacing.padding = #250
%     \override StaffGrouper.staff-staff-spacing.basic-distance = #250
  
  }


\score {
  <<                          % ← this is the one you asked about (Score-level)
    \new Staff = "treble" {
      <<                      % ← combines melody + breaks within the Staff
        \melody
        \new Voice {
          \partial 2 s2
          s1 * 4 \break
          s1 * 4 \break
          s1 * 4 \break
 \repeat unfold 4 { s1 * 4 \break }
s1 * 4   % bar 29–32, no break
        }
      >>
    }
    
    
    \new ChordNames {
      
      \mainChords
      
      
    }
    
      \new RhythmicStaff {
<<
  
        \new Voice = "phrasing" \with {
        %  \omit NoteHead
    %       \omit Stem
%           \omit Beam
%           \omit Flag
        } \phrasingHarmonic

        \new Voice = "harmonicR" \with {
          \omit NoteHead
          \omit Stem
          \omit Beam
          \omit Flag
        } \harmonicR
>>
      }
      \new Lyrics \lyricsto "harmonicR" { \analysis }
  \advancedAnalysis{
  \new Lyrics \lyricsto "harmonicR" { \analysisSol }}
  {
  }
  %     \new Lyrics \with {
%         \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 6))
%       } \lyricsto "phrasing" { \analysis }

    \new StaffGroup \with {
  
      instrumentName = \markup { \italic "cpt. à 3 voix" }
      shortInstrumentName = "ctp."

    } <<
      \new Staff {
      
        <<
          \new Voice = "upper" { \voiceOne \soprano }
          \new Voice = "mid"   { \voiceTwo \alto }
        >>
      }
      \new Staff {
        \bassLine
      }
    >>
  >>
  
  

  \midi {}
}