
\version "2.24.1"
\include "roman_numeral_analysis_tool.ily"

% ===============================================================
% === 1. HEADER & GLOBAL CONFIGURATION
% ===============================================================

\paper {
  indent = 0
  ragged-last-bottom = ##f
  page-count = 1
  tagline = ##f
  top-margin = 3\cm
  bottom-margin = .5\cm
  system-system-spacing.minimum-distance = #25
  system-system-spacing.padding = #25
  system-system-spacing.stretchability = #25
}

\layout {
  \context {
    \Score
        \override SpacingSpanner.shortest-duration-space = #6
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
    \override NonMusicalPaperColumn.line-break-permission = ##f
    \override NonMusicalPaperColumn.page-break-permission = ##f
  }
      \context {
      \Lyrics
      % to control global size
      \override LyricText.font-size = #-1
    }
}

% ===============================================================
% === 2. MUSICAL DEFINITIONS
% ===============================================================
% All musical snippets are defined here, before the \score block.

global = {
  \key c \major
  \time 3/4
}

% --- PIANO MUSIC (FINAL SECTION) ---
righthand = \relative c'' {
  <g e' g>4 <g e' g> <g e' g> |
  <g e' g>4. <g d' f>8 <g c e>4 |
  <g d' f>4 <g d' f> <g d' f> |
  <g d' f>4. <g c e>8 <g b d>4 |
  <g c e>4 <a f'>8 <g e'> <f d'> <e c'> |
  <g c e>4. <f c' f>8 <g c g'>4 |
  \tuplet 3/2 {a'8 g f} <g, c e>4 <f b d> |
  <e g c>4 r r \bar "|."
}

lefthand = \relative c {
    \clef bass
  \key c \major
  \time 3/4
  c4 e g |
  c c, r4 |
  g b d |
  g g, r4 |
  c c' c |
  c4. a8 e4 |
  f8 d g4 g, |
  c g c, \bar "|."
}



% --- LEVEL TWO ANALYSIS ---
righthandTwo = \relative c' {
 % \override Staff.BarLine.transparent = ##t
  \override Staff.BarLine.stencil = ##f
  <<
    \new Voice \with { \voiceOne \remove "Stem_engraver" \remove "Beam_engraver" \override Dots.stencil = ##f } {
      g''4( s2 | s4.-\markup \halign #-.2 \italic {3-prg. } f8 e4) | f4( s2 | s4.-\markup \halign #-.2 \italic {3-prg. } e8 d4) | \slurDashed e4( f8-\markup \tiny { \bold N } \slurSolid e)( d-\markup \halign #-.2 \italic {3-prg. } c)( | \omit TupletBracket e4.)(-\markup \halign #.5 \italic {arp. } f8-\markup \halign #-.3 \italic {3-prg. } g4) | \omit TupletNumber \tuplet 3/2 {a8( g-\markup \halign #-.2 \italic {3-prg. } f)(} e4-\markup \halign #-1 \italic {3-prg. } d) | c4 s2 \bar "||"
    } \\
    \new Voice \with { \voiceTwo \remove "Stem_engraver" \remove "Beam_engraver" \override Dots.stencil = ##f } {
      \once \override Slur.positions = #'(3 . 3) e4( s2 | s4. d8 c4) | d4( s2 | s4. c8 b4) | \once \override Glissando.style = #'dashed-line c4 \glissando s2 | s2. | s4 c b | g s2 |
    } \\
    \new Voice \with { \voiceThree \remove "Stem_engraver" \remove "Beam_engraver" \override Dots.stencil = ##f } {
      \slurDashed \slurDown g4( s2 | s2. *3 | g4) ( a8 \slurSolid g)( f e)(| \slurDashed g4.)( f8_\markup \tiny { \bold N } g4)( | s4 g4) f | e s2
    }
  >>
 % \override Staff.BarLine.transparent = ##f
  \override Staff.BarLine.stencil = ##t
  \bar "|"
}

lefthandTwo = \relative c {
  %\override Staff.BarLine.transparent = ##t
  \override Staff.BarLine.stencil = ##f
  \override Stem.stencil = ##f
  \override Beam.stencil = ##f
  \override Flag.transparent = ##t
  c4( e^\markup { \italic arp. } g | c)( c,) s4 | g( b^\markup { \italic arp. } d | g)( g,) s4 |
  <<
    { \override Stem.stencil = ##f \override Beam.stencil = ##f \override Flag.transparent = ##t c ( c') s4 | s4. a8 e4 | }
    \\
    { \override Stem.stencil = ##f \override Beam.stencil = ##f \override Flag.transparent = ##t \slurDashed c( s2 | s2 e4) | }
  >>
  \oneVoice
  f8( d-\markup \halign #.2 \italic {arp. }) g4( g,) |
  c( g_\markup { \italic arp. } c,)
  %\override Staff.BarLine.transparent = ##f 
  \revert Stem.transparent \override Staff.BarLine.transparent = ##f
  \override Staff.BarLine.stencil = ##t 
  \bar "|"
}

% --- LEVEL THREE ANALYSIS ---
levelThreeRight = \relative c''' {
  \override Staff.BarLine.transparent = ##t
  \override Staff.BarLine.stencil = ##f
  <<
    <<
      { \override Staff.NoteColumn.merge-differently-headed = ##t \override NoteHead.transparent = ##t \override Dots.stencil = ##f \override Stem.length = #12 \stemUp \override Slur.positions = #'(5 . 5) g4 s2 s2. f4 s2 s2.\slurDashed e4( s2 e4)( s2 s4 e4) d4 c4 s2 \revert Beam.positions \revert NoteHead.transparent }
      \\
      
     %%%% unfolding %%%%
     
       {  
       s2. * 6 | %m1-6
              \stemDown  a'8[ \stemUp f8]

       
       } 
      
      \\
       \new Voice \with { \voiceTwo \remove "Stem_engraver" \remove "Beam_engraver" }    { \override Staff.NoteColumn.merge-differently-headed = ##t  \stemUp \slurUp \override Slur.positions = #'(0 . -2) <e g(>4 s2 s4. <d f>8^\markup \halign #12 \italic {3 prg. } <c e>4) <d f>4( s2 s4. <c e>8^\markup \halign #12 \italic {3 prg. } <b d>4) 
  \slurDashed   \once \override Slur.positions = #'(0 . 3 )  e4( f8-\markup \halign #1 \tiny { \bold N } \slurSolid e)( d-\markup \tiny  \halign #-.2 \italic {3-prg. } c)( | \override Stem.stencil = ##f \override Beam.stencil = ##f \omit TupletBracket e4.)(-\markup \tiny \halign #.0 \italic {arp. } f8 g4) | s4 \override Slur.positions = #'(2 . 2)  e4( d8^\markup  \italic {3 prg. } s8 c8) s8 s2 % \revert Stem.transparent 
        \override Staff.BarLine.transparent = ##f
      } % \bar "||"   
      \\
      
     \new Voice \with {\voiceThree \remove "Stem_engraver" \remove "Beam_engraver" }  { 
       \override Staff.NoteColumn.merge-differently-headed = ##t 
       s2. *4 | %m 1- 5 
       c4 s2 | %m6
        s2. | %m7
         s2 b4 | %m7
        g4 s2 |%m8
      
      }
      \\
      \new Voice \with { \voiceFour \remove "Stem_engraver" \remove "Beam_engraver" } {\override Staff.NoteColumn.merge-differently-headed = ##t 
        \override Dots.stencil = ##f \slurDashed \slurDown g4( s2 | s2. *3 | g4) ( a8 \slurSolid g)( f e)(| \slurDashed g4.)( f8_\markup \tiny { \bold N } g4)( | s4 g4) f |  e s2
      }
    >> 

     \override Staff.BarLine.stencil = ##t % Re-enable barline stencil for this bar
   %   \bar "|" % This will now show because the stencil is re-enabled 
  >>
        \override Staff.BarLine.transparent = ##f
}

levelThreeLeft = \relative c {
   \override Staff.BarLine.transparent = ##t
% \override Staff.BarLine.stencil = ##f
 <<
% below is just the stems (I think)
 <<
  \new Voice \with { \voiceOne \remove "Beam_engraver" \override Dots.stencil = ##f } {
   \override Staff.NoteColumn.merge-differently-headed = ##t \override Stem.length = #12 \override Slur.positions = #'(-5 . -5) \override NoteHead.transparent = ##t \stemDown \slurDown \slurDashed c4( s2 |
   s4 c4) s4 |
   \override Slur.positions = #'(-7 . -7) g4( s2 |
   s4 g4) s4 | 
  \slurSolid  \override Slur.positions = #'( 20 . 20)  c4(  c'4)  s4 | %m5
   s2 s4 | %m6
   s8 d,8    g4  s4 | %m7
 c,4 s2
 \revert Beam.positions \revert NoteHead.transparent
 \revert Stem.transparent \override Staff.BarLine.transparent = ##f 
      \bar "|"
  }
  \new Voice \with { \voiceTwo \remove "Stem_engraver" \remove "Beam_engraver" \override Dots.stencil = ##f \override Staff.NoteColumn.merge-differently-headed = ##t \override Stem.stencil = ##f \override Beam.stencil = ##f \override Flag.transparent = ##t } {
    % --- CORRECTED MUSIC BELOW ---
    % Instead of calling \lefthandTwo, we use its music but modify the one problematic measure.
    \override Stem.stencil = ##f
    \override Beam.stencil = ##f
    \override Flag.transparent = ##t
    c4( e^\markup { \italic arp. } g | c)( c,) s4 | g( b^\markup { \italic arp. } d | g)( g,) s4 | 
     
     \revert Beam.positions \revert NoteHead.transparent
 \revert Stem.transparent \override Staff.BarLine.transparent = ##f 
       %  \bar "|"
    <<
      % THIS IS THE FIX: c4 is changed to s4 to avoid doubling the note from the other voice.
   \new Voice \with { \voiceThree \remove "Stem_engraver" \remove "Beam_engraver"}{ \override Dots.stencil = ##f \override Staff.NoteColumn.merge-differently-headed = ##t \override Stem.stencil = ##f \override Beam.stencil = ##f \override Flag.transparent = ##t         \override Staff.BarLine.transparent = ##t     s4  c'4 s4 | s4. a8 e4 | 
         \revert Beam.positions \revert NoteHead.transparent
 \revert Stem.transparent 
   } % m 6 and 7 
      \\
     
  %   Slur from I to I6 mm5-6
  \new Voice \with { \voiceTwo}{
       \override Staff.BarLine.transparent = ##t
    
    \override Stem.stencil = ##f \override Beam.stencil = ##f \override Flag.transparent = ##t
   \slurDashed c( s2 | s2 e4) |  \slurSolid 
   \override Stem.stencil = ##t  \override Beam.stencil = ##t 
   \stemDown f8 [  \stemUp d  ]  g4( g,) |
   c( g_\markup { \italic arp. } c,)  
    \revert Stem.transparent \override Staff.BarLine.transparent = ##f
      \revert Beam.positions \revert NoteHead.transparent
     \override Staff.BarLine.transparent = ##f

      \bar "|"
    } %m 5 and 6
         
    >>
    %\oneVoice
  

 
  } 
>>  


 % Re-enable barline stencil for this bar
      \bar "|" % This will now show because the stencil is re-enabled 
>>
 
 }


% --- LEVEL FOUR ANALYSIS ---
levelFourRight = \relative c'' {
  \override Staff.BarLine.transparent = ##t
  <<
    { \override Staff.NoteColumn.merge-differently-headed = ##t \override Beam.positions = #'(12 . 12) \override NoteHead.transparent = ##t [g'8 s8 s2 s2. f8 s8 s2 s2. e8 s8 s2 s2. s2 d8 s8 c8] s8 s2 \revert Beam.positions \revert NoteHead.transparent }
    \\
    { \override Staff.NoteColumn.merge-differently-headed = ##t \override Stem.transparent = ##t \stemUp g'8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 5} } } s8 s2 s2. f8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 4} } } s8 s2 s2. \slurDashed e8(^\markup { \override #'(baseline-skip . 1) \column { \small {^ 3} } } s8 s2 s2. s4 e8) s8 d8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 2} } } s8 c8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 1} } } s8 s2 \revert Stem.transparent \override Staff.BarLine.transparent = ##f } \bar "||"
 \\
 {
   s2.* 6 | 
  \override Stem.length = #10 f8(_\markup \small \bold {N}  s8 \override Staff.NoteColumn.merge-differently-headed = ##t \override Stem.transparent = ##t \stemDown e4) |
   
 }
  
  
  >>
}

levelFourLeft = \relative c {

  \override Staff.BarLine.transparent = ##t
  <<
    { \override Staff.NoteColumn.merge-differently-headed = ##t \override Beam.positions = #'(-12 . -12) \override NoteHead.transparent = ##t \stemDown [c8 s8 s2 s2. g8 s8 s2 s2. c8 s8 s2 s1 g'8 s8 s4 c,8] s8 s2 \revert Beam.positions \revert NoteHead.transparent }
    \\
    { \override Staff.NoteColumn.merge-differently-headed = ##t \override Stem.transparent = ##t c8_\markup  \halign # 2 {{\bold do :} {I}} s8 s2 s2. g8_\markup{V} s8 s2 s2. c8_\markup{I} s8 s2 s2.   \once \override Slur.positions = #'(0 . 30) \stemUp d8( s8  g8)_\markup{V} s8 s4 c,8_\markup{I} s8 s2 \revert Stem.transparent \override Staff.BarLine.transparent = ##f } \bar "||"
    \\
    {
   
      
      s2. *6 \stemDown \override Stem.length = #10 d8_\markup{(ii)} s8 s2 s2. }
  >>
}

aligner = \relative { c2. |  %m1
                      r2.  | %m2
                      g2. | %m3 
                      r2. | %m4
                      c2. | %m5 
                      r2. | %m6 
                      r4 g2 | %m7 
                      c2. | %m8 



}

%--------------------------------------------------------------------------------------
% ==== 2.1 Analysis 
%================================================================



% analysis = \lyricmode {
%   \override LyricText.self-alignment-X = #-0.6
%   \offset StanzaNumber.X-offset #-3
%   \set stanza  = #"G:"
%   % For bare Roman numerals, \rN simply outputs the string.
%   %\markup \rN { I }
%   I
%   \markup \rN { V 6 5 }
%   \markup \rN { vii o 4 3 / IV }
%   \markup \rN { IV 6 }
%   \markup \rN { ii h 4 3 }
%   \markup \rN { Fr +6 }
%   \markup \rN { I 6 4 }
% 
% 
% }



bassline = \relative c' {
  \clef bass
  \key g \major
  \time 3/4
  g4 fis f
  e es es
  d2 dis4
  e2.
  \bar "||"
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = # "do :"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
 
  \markup \rN { I }  \markup \rN {  }       \markup \rN {  } %%m1
   \markup \rN {  }   \markup \rN {   }     %m2 (because of rest in the bass
   \markup \rN { V 7 }    \markup \rN { }   \markup \rN {  } %m3
       \markup \rN {  }   \markup \rN {   }  %m4
       \markup \rN { I }   \markup \rN {   }  \markup \rN {  } %m5
             \markup \rN { }      \markup \rN { IV 6  }   \markup \rN { I 6 } %m6
    
        \markup \rN { ii 6 }          \markup \rN { 5 }  \markup \rN { V 6 4 }   \markup \rN { 7 } %m7
    \markup \rN { I } %m8
 
}



anaFour = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = # "do :"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
 
  \markup \rN { I }  \markup \rN {  }       \markup \rN {  } %%m1
%    \markup \rN {  }   \markup \rN {   }     %m2 (because of rest in the bass
%    \markup \rN { V 7 }    \markup \rN { }   \markup \rN {  } %m3
%        \markup \rN {  }   \markup \rN {   }  %m4
%        \markup \rN { I }   \markup \rN {   }  \markup \rN {  } %m5
%              \markup \rN { }      \markup \rN { IV 6 4 }   \markup \rN { I 6 } %m6
%     
%         \markup \rN { ii 6 }          \markup \rN { 5 }  \markup \rN { V 6 4 }   \markup \rN { 7 } %m7
%     \markup \rN { I } %m8
%  
}

% analysis = \lyricmode {
%   \set stanza = \markup \keyIndication { Eflat } %% after 2.19.15 use E-flat
%   \override LyricText.self-alignment-X = #LEFT
%   \markup \rN { I } " " 
%   \markup \rN { IV 6 }
%   \markup \rN { It +6 }
%   \markup \rN { V }
%   % Equivalent to the following:
%   % V2.
% }


% ===============================================================
% === 3. SCORE BLOCK
% ===============================================================
% This block assembles all the defined variables into the final layout.

\score {
  <<
    % --- ANALYSIS STAVES ---
    \new StaffGroup \with { \override SpanBar.transparent = ##t \override SpanBar.stencil = ##f }
    <<
      \new PianoStaff \with {  instrumentName = "4" \override StaffGrouper.staff-staff-spacing = #'( (basic-distance . 4) (minimum-distance . 3) (padding . 1) ) \override TimeSignature.stencil = ##f }
      <<
        \new Voice = "L4a"{ \levelFourRight}
       
         
        \new Voice = "L4b" {   \clef bass \levelFourLeft }
        % this line works under level 2b (with \newVoice = "L2b) but can't be found here. 
              \new Lyrics \lyricsto "L4b" {\anaFour}    
             
         
     
       
      >>
    
      % % Vertical spacer
      \new Staff \with { \remove Staff_symbol_engraver \override Staff.transparent = ##t \override Clef.stencil = ##f \override TimeSignature.stencil = ##f } { s2.*8 }
      
      \new PianoStaff \with { instrumentName = "3" \override StaffGrouper.staff-staff-spacing = #'( (basic-distance . 4) (minimum-distance . 3) (padding . 1) ) \override TimeSignature.stencil = ##f }
      <<
       \new Voice = "L3a" { \levelThreeRight }   
      
        \new Voice = "L3b" { \clef bass \levelThreeLeft }  


      >>
      
      % Vertical spacer
     \new Staff \with { \remove Staff_symbol_engraver \override Staff.transparent = ##t \override Clef.stencil = ##f \override TimeSignature.stencil = ##f  } { s2.*8 }

      \new PianoStaff \with {  instrumentName = "2" \override StaffGrouper.staff-staff-spacing = #'( (basic-distance . 4) (minimum-distance . 3) (padding . 1) ) \override TimeSignature.stencil = ##f }
      <<
        \new Voice = "L2a" { \override Staff.NoteColumn.merge-differently-headed = ##t \global \righthandTwo }
        \new Voice = "L2b" { \override Staff.NoteColumn.merge-differently-headed = ##t \global \clef bass \lefthandTwo }
          
      
      >>
    >>
    %%this test material showing no problem
 %  \new Staff <<
%     \new Voice = "bass" { \bassline }
%     \new Lyrics \with {
%       % to control distance of analysis from staff
%       \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 6.5))
%     } \lyricsto "bass" { \analysis }
%   >>
    % --- PERFORMANCE STAFF ---
    \new PianoStaff \with {  instrumentName = "1" \override StaffGrouper.staff-staff-spacing = #'( (basic-distance . 6) (minimum-distance . 5) (padding . 2) ) }
    <<
      \new Voice = "right" {  \righthand }
    
      \new Voice = "left" {  \lefthand }
      %%% this test material not showing 
         \new Lyrics \lyricsto "left" {\analysis}
    
    >>

  >>
}
