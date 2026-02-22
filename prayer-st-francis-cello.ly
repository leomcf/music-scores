\version "2.24.1"


tagline = ##f 

global = 
{ \key c\major
   \time 2/2  
     % \tempo 4 = 155 
                
}

cello = \relative c {    \global
\clef "bass" 
     
  \repeat volta 2  {

 c1~_pizz | %m1
 c2. g4 | %m2
 c1~		|%m3
 c1		|%m4
 c1~		| %m5
 c2. g4 |	%m6
 g1~		|%m7
 g1		|%m8
 g1~		|%m9
 g2 g'4 d | %m10
 g,1~	 	| %m11
 g1		|%m12
 g2. 4 	|%m13
 
 \alternative {
      \volta 1 {  g2 a4 b | %m14	
                   c2. c4 | %m15
                   c2 g 	|%m16
      }
   \volta 2 { g2 r2_arco | 
              c2\downbow d4( e) |
              d( c) d( e) | 
            }
         
      }
  }
      

\repeat volta 2 {
  
f1~	 |
f1	|
e1~	|
e1	|

\alternative {
 \volta 1 { 
d1	|
g1	|
c,1~	|
c2 f4 e | 
    }

\volta 2 {
  d1		|
  d2 e4 fis | 
  g2 r2 		|
  g,1_pizz 		|
          }
}

}

        
        {
          
 c1~ | %m1
 c2. g4 | %m2
 c1~		|%m3
 c1		|%m4
 c1~		| %m5
 c2. g4 |	%m6
 g1~		|%m7
 g1		|%m8
 g1~		|%m9
 g2 g'4 d | %m10
 g1	 	| %m11
 g,1		|%m12
 g2. 4 	|          
          
 g2 g4 f |
 e2 d2 | 
 c1	 
      
        \bar "|."
        } 









 %  s1*15	|
%   r8 g r8 g b\glissando g c4-. | %m16
%   d2.~
% 
%   d4\bendAfter #-4.75
% 
%   |  %m17
% 
%   r8 g, r4 b8 g c d~ | % m18
%   d1			| %m19
%   r4 \tuplet 4/3 {g,4 b c d~ }  | %m20
%   d8\glissando g~ g4.~
%   g8\bendAfter #-4.75
% 
% 
%   r8 d8~ | %m21
% 
%   d2~ d4\glissando (b4 | %m22
%   a1~) 						| %m23
%   a4 r \tuplet 3/2 {d4 c b} | %m24
%   g2. g8 b~			| %m25
%   b4  r4 b8 c4 d8~		| %m26 (in an ideal world  there'd be a \bendBefore function in lilypond fo the final note
%   d c~ 2. 				| % m27
%   r4 g8 g b g c4-.
%   %{   \cadenzaOn
%  \hideNotes
%  c2\glissando
%     \unHideNotes
%   \cadenzaOff 	%} 		| %m28
%   \appoggiatura c8  d2 \appoggiatura b4 beh2	| %m29  
%   g2 \parenthesize g8 a4~ a8\glissando | %m30
%   g4 r2. | %m31
%   
  



}

% \relative c'' {
%   \time 3/4
%   \override Glissando.style = #'zigzag
%   c4 c
%   \cadenzaOn
%   c4\glissando
%   \hideNotes
%   c,,4
%   \unHideNotes
%   \cadenzaOff
%   \bar "|"
% }



% \score {
%  
% 
%   \new staff  \with 
%   {
% 
%     
%     instrumentName = "cello"
%     shortInstrumentName = "vc."
% }   
%   <<
% 
% 
%     \cello
% 
% 
% 
% 
%   >>
% 
% }
