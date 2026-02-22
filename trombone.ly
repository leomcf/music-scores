\version "2.24.1"


trombone = \relative c' {
  \clef bass
%   \override Glissando.style = #'zigzag

  s1*15	|
  r8 g r8 g b\glissando g c4-. | %m16
  d2.~

  d4\bendAfter #-4.75

  |  %m17

  r8 g, r4 b8 g c d~ | % m18
  d1			| %m19
  r4 \tuplet 4/3 {g,4 b c d~ }  | %m20
  d8\glissando g~ g4.~
  g8\bendAfter #-4.75


  r8 d8~ | %m21

  d2~ d4\glissando (b4 | %m22
  a1~) 						| %m23
  a4 r \tuplet 3/2 {d4 c b} | %m24
  g2. g8 b~			| %m25
  b4  r4 b8 c4 d8~		| %m26 (in an ideal world  there'd be a \bendBefore function in lilypond fo the final note
  d c~ 2. 				| % m27
  r4 g8 g b g c4-.
  %{   \cadenzaOn
 \hideNotes
 c2\glissando
    \unHideNotes
  \cadenzaOff 	%} 		| %m28
  \appoggiatura c8  d2 \appoggiatura b4 beh2	| %m29  
  g2 \parenthesize g8 a4~ a8\glissando | %m30
  g4 r2. | %m31
  
  



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



\score {


  \new Staff  \with {
    instrumentName = "trombone"
    shortInstrumentName = "tb."
  }   	<<


    \trombone




  >>

}
