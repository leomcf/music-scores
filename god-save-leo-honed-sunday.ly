\version "2.24.1"
\paper {
  indent = 0
  ragged-last-bottom = ##f
  page-count = 1
  tagline = ##f
  top-margin = 3\cm
  bottom-margin = 0\cm
  % Increased space between systems
  system-system-spacing.minimum-distance = #25 % Slightly reduced from 30 for testing
  system-system-spacing.padding = #25
  system-system-spacing.stretchability = #25
}

% Global settings
global = {
  \key c \major
  \time 3/4
}

% Empty staff with NO barlines, but staff lines are visible.
% Clefs and time signatures are invisible.
emptyStaffNoBarlines = {
  \override Staff.StaffSymbol.transparent = ##f % Ensure staff lines are visible
  \override Staff.Clef.transparent = ##t         % Make clef invisible
  \override Staff.BarLine.transparent = ##f      % Make barlines invisible
  \override Staff.BarLine.stencil = ##f          % Ensure no stencil for barlines
  \override Staff.TimeSignature.transparent = ##t % Make time signature invisible
  s2.*8 % Eight measures of silence to occupy space
}







levelFourRight = \relative c'' { 
    \override Staff.BarLine.transparent = ##t      % Make barlines invisible
      
  
    <<  
      {   \override Staff.NoteColumn.merge-differently-headed = ##t  \override Beam.positions = #'(12 . 12)   \override NoteHead.transparent = ##t    [g'8 s8 s2 s2. f8 s8 s2 s2. e8 s8 s2 s2. s2 d8 s8 c8] s8 s2     \revert Beam.positions    \revert NoteHead.transparent    }  \\  
         {  \override Staff.NoteColumn.merge-differently-headed = ##t   \override Stem.transparent = ##t  \stemUp  g'8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 5} } } s8 s2 s2. f8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 4} } } s8 s2 s2. e8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 3} } } s8 s2 s2. s2 d8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 2} } } s8 c8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 1} } } s8 s2     \revert Stem.transparent     \override Staff.BarLine.transparent = ##f      } \bar "||"
    >> 
  
  
  
  
  
}


levelFourLeft = \relative c { 
    \override Staff.BarLine.transparent = ##t      % Make barlines invisible
      
  
    <<   {   \override Staff.NoteColumn.merge-differently-headed = ##t  \override Beam.positions = #'(-12 . -12)   \override NoteHead.transparent = ##t \stemDown  [c8 s8 s2 s2. g8 s8 s2 s2. c8 s8 s2  s1 g'8 s8 s4 c,8] s8 s2     \revert Beam.positions    \revert NoteHead.transparent    }  \\  
         {  \override Staff.NoteColumn.merge-differently-headed = ##t   \override Stem.transparent = ##t       c8 s8 s2 s2. g8 s8 s2 s2. c8 s8 s2  s1 g'8 s8 s4 c,8 s8 s2    \revert Stem.transparent     \override Staff.BarLine.transparent = ##f      } \bar "||"
  
  
    \\
    
    { s2.  *6 \stemDown \override Stem.length = #10 d8 s8 s2 s2. 
      
      
    }
    >>
    }
  
       
    
    
 
  
  
  levelThreeRight = \relative c''' {
      \override Staff.BarLine.transparent = ##t      % Make barlines invisible
  \override Staff.BarLine.stencil = ##f  
    %\remove "Beam_engraver"
    
    
    
    <<
      
       <<  
      {   \override Staff.NoteColumn.merge-differently-headed = ##t   \override NoteHead.transparent = ##t     \override Dots.stencil = ##f  \override Stem.length = #12 \stemUp  \override Slur.positions = #'(5 . 5)   g4 s2 s2. f4  s2 s2.\slurDashed e4(  s2 e4)( s2 s4 e4) d4  c4  s2     \revert Beam.positions    \revert NoteHead.transparent    }  \\  
      %line below just note heads 
         {  \override Staff.NoteColumn.merge-differently-headed = ##t   \override Stem.transparent = ##t     \override Dots.stencil = ##f \stemUp   \slurUp   \override Slur.positions = #'(0 . -2)  < e   g( >4 s2 s4. <d f>8^\markup \halign #12  \italic {3 prg. }   <c e >4)  <d f>4( s2 s4. <c e>8^\markup \halign #12  \italic {3 prg. }  <b d>4) e4  
            
            ( f8-\markup \tiny { \bold N } \slurSolid  e)( d-\markup \halign #-.2 \italic {3-prg. } c)( |
      
      \override Stem.stencil = ##f
  \override Beam.stencil = ##f
      \omit TupletBracket
         e4.)(-\markup \halign #.5 \italic {arp. }  f8 g4) |
            
            
            
            
            
         s4  e d8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 2} } } s8 c8^\markup { \override #'(baseline-skip . 1) \column { \small {^ 1} } } s8 s2     \revert Stem.transparent     \override Staff.BarLine.transparent = ##f      } \bar "||" \\
       
           \new Voice \with { \voiceThree
      % Remove engravers responsible for stems and beams in this voice
      \remove "Stem_engraver"
      \remove "Beam_engraver"
    } {
      % Ensure consistent overrides for the second voice
      \override Dots.stencil = ##f
    %\override Slur.positions = #'(-3 . -3)   
    \slurDashed \slurDown
    g4( s2 |
    s2. *3 |
    g4) ( a8 \slurSolid g)( f e)(|
  \slurDashed g4.)( f8_\markup  \tiny { \bold N } g4)( |
  s4 g4) f | 
  e s2
    
    }
       
       
  
    >> 
  
      
      
    >>
    
    
    
    
    
    
  }
  
  levelThreeLeft = \relative c { 
    \override Staff.BarLine.transparent = ##t      % Make barlines invisible
  <<
    \new Voice \with { \voiceOne
      % Remove engravers responsible for stems and beams in this voice
      \remove "Stem_engraver"
      \remove "Beam_engraver"
      \override Dots.stencil = ##f
        
  
         \override Staff.NoteColumn.merge-differently-headed = ##t   \override Stem.length = #12 \override Slur.positions = #'(-5 . -5)  \override NoteHead.transparent = ##t \stemDown \slurDown \slurDashed c4( s2 s4 c4) s4 | 
             \override Slur.positions = #'(-7 . -7) 
             g4(  s2 |
             s4   g4) s4 |
             c8 s8 s2  s1 g'8 s8 s4 c,8] s8 s2     \revert Beam.positions    \revert NoteHead.transparent    }    
  
  
    \new Voice \with { \voiceTwo
      % Remove engravers responsible for stems and beams in this voice
      \remove "Stem_engraver"
      \remove "Beam_engraver"
      \override Dots.stencil = ##f
      
      \lefthandTwo
      
           
    }
    >>
    
    }
  
  
  
  
  
  
  
  
  
       %   {  \override Staff.NoteColumn.merge-differently-headed = ##t   \override Stem.transparent = ##t       
%   % Override Stem stencil globally for this voice block
%   \override Staff.BarLine.transparent = ##t      % Make barlines invisible
%   \override Staff.BarLine.stencil = ##f  
%   \override Stem.stencil = ##f
%   \override Beam.stencil = ##f % Ensure no beams
%   \override Flag.transparent = ##t
% \slurUp
%   c4( e^\markup { \italic arp. } g |
%   c)( c,) s4 |
%   g( b^\markup { \italic arp. } d |
%   g)( g,) s4 |
%   
%   
%          }
%   
%          >>
%          
%           <<
% {  \override Stem.stencil = ##f
%   \override Beam.stencil = ##f % Ensure no beams
%   \override Flag.transparent = ##t 
%   
%   
%   c ( c') s4 |
%   s4. a8 e4 | } 
%   
%   \\
%   
%   %% extra voice to produce dotted slur to E in measure 6
%   {   \override Stem.stencil = ##f
%   \override Beam.stencil = ##f % Ensure no beams
%   \override Flag.transparent = ##t  
%     
%     \slurDashed
%     c( s2 |
%   s2 e4) | 
%   }
%   >>
%   
%   \oneVoice
%   f8( d-\markup \halign #.2 \italic {arp. }) g4( g,) |
%   c( g_\markup { \italic arp. } c,)   \override Staff.BarLine.transparent = ##f      % Make barlines visible
%   \override Staff.BarLine.stencil = ##t  \bar "|"
%   
%    
%   
%   
% 
%          
%          
%          
%          
%          
%          
 




% Level two analysis - Right Hand
righthandTwo = \relative c' {
  \override Staff.BarLine.transparent = ##t      % Make barlines invisible
  \override Staff.BarLine.stencil = ##f  
    %\remove "Beam_engraver"
  % Override Dots stencil globally for this voice block
  %\override Dots.stencil = ##f

  <<
    \new Voice \with { \voiceOne
      % Remove engravers responsible for stems and beams in this voice
      \remove "Stem_engraver"
      \remove "Beam_engraver"
      \override Dots.stencil = ##f
    } {
       g''4( s2 |
      s4.-\markup \halign #-.2 \italic {3-prg. }  f8  e4) |
      f4( s2 |
      s4.-\markup \halign #-.2 \italic {3-prg. }  e8 d4) |

      % No \stemDown needed as stems are removed
        %  \override Slur.positions = #'(2.5 . 1.5) 
      \slurDashed e4( f8-\markup \tiny { \bold N } \slurSolid  e)( d-\markup \halign #-.2 \italic {3-prg. } c)( |
      
      \override Stem.stencil = ##f
  \override Beam.stencil = ##f
      \omit TupletBracket
         e4.)(-\markup \halign #.5 \italic {arp. }  f8-\markup \halign #-.3 \italic {3-prg. }  g4) |
  \omit TupletNumber \tuplet 3/2 {a8( g-\markup \halign #-.2 \italic {3-prg. }  f)(}  e4-\markup \halign #-1 \italic {3-prg. }   d) |
   c4 s2 \bar "||"
  
      
      
      
      
      
    }
    \\
   \new Voice \with { \voiceTwo
  % Remove engravers responsible for stems and beams in this voice
  \remove "Stem_engraver"
  \remove "Beam_engraver"
} {
  % Ensure consistent overrides for the second voice
  \override Dots.stencil = ##f
    \once \override Slur.positions = #'(3 . 3) 
 e4( s2 |
    % 1. Tell the text to ignore the slur
    %\once \override TextScript.avoid-slur = #'inside
    % 2. Now you can precisely position it.
    %    A less negative Y-value moves it UP.
  %  \once \override TextScript.positions = #'(0 . 10)
    s4. d8 c4) |

  d4( s2 | 
    s4. c8 b4) |     \once \override Glissando.style = #'dashed-line
    c4 \glissando s2 | 

    s2. |
    s4 c b |
    g s2 |

 
}
      \\
    \new Voice \with { \voiceThree
      % Remove engravers responsible for stems and beams in this voice
      \remove "Stem_engraver"
      \remove "Beam_engraver"
    } {
      % Ensure consistent overrides for the second voice
      \override Dots.stencil = ##f
    %\override Slur.positions = #'(-3 . -3)   
    \slurDashed \slurDown
    g4( s2 |
    s2. *3 |
    g4) ( a8 \slurSolid g)( f e)(|
  \slurDashed g4.)( f8_\markup  \tiny { \bold N } g4)( |
  s4 g4) f | 
  e s2
    
    }
    
  >>

  % Ensure stems and beams are also omitted for this section if desired
  % This applies to the default voice outside the << \\ >> structure
  \override Stem.stencil = ##f
  \override Beam.stencil = ##f
%   <g c e>4. <f f'>8 <g g'>4 |
%   \omit TupletNumber \tuplet 3/2 {a'8 g f} <g, e'>4 <f b d> |
%   <e g c>4 s2 
  
  \override Staff.BarLine.transparent = ##f      % Make barlines visible
  \override Staff.BarLine.stencil = ##t  \bar "|"
}

% Level two analysis - Left Hand
lefthandTwo = \relative c {
  % Override Stem stencil globally for this voice block
  \override Staff.BarLine.transparent = ##t      % Make barlines invisible
  \override Staff.BarLine.stencil = ##f  
  \override Stem.stencil = ##f
  \override Beam.stencil = ##f % Ensure no beams
  \override Flag.transparent = ##t

  c4( e^\markup { \italic arp. } g |
  c)( c,) s4 |
  g( b^\markup { \italic arp. } d |
  g)( g,) s4 |
  
  <<
{  \override Stem.stencil = ##f
  \override Beam.stencil = ##f % Ensure no beams
  \override Flag.transparent = ##t 
  
  
  c ( c') s4 |
  s4. a8 e4 | } 
  
  \\
  
  %% extra voice to produce dotted slur to E in measure 6
  {   \override Stem.stencil = ##f
  \override Beam.stencil = ##f % Ensure no beams
  \override Flag.transparent = ##t  
    
    \slurDashed
    c( s2 |
  s2 e4) | 
  }
  >>
  
  \oneVoice
  f8( d-\markup \halign #.2 \italic {arp. }) g4( g,) |
  c( g_\markup { \italic arp. } c,)   \override Staff.BarLine.transparent = ##f      % Make barlines visible
  \override Staff.BarLine.stencil = ##t  \bar "|"
  
   
  
  
}

% Piano music at the bottom - Right Hand
righthand = \relative c'' {
  <g e' g>4 <g e' g> <g e' g> | % Replaced q with explicit chord
  <g e' g>4. <g d' f>8 <g c e>4 |
  <g d' f>4 <g d' f> <g d' f> | % Replaced q
  <g d' f>4. <g c e>8 <g b d>4 |
  <g c e>4 <a f'>8 <g e'> <f d'> <e c'> |
  <g c e>4. <f c' f>8 <g c g'>4 |
  \tuplet 3/2 {a'8 g f} <g, c e>4 <f b d> |
  <e g c>4 r r \bar "|."
}

% Piano music at the bottom - Left Hand
lefthand = \relative c {
  c4 e g |
  c c, r4 |
  g b d |
  g g, r4 |
  c c' c |
  c4. a8 e4 |
  f8 d g4 g, |
  c g c, \bar "|."
}

% Score structure
\score {
   <<
    % Empty staves group
    \new StaffGroup \with {
      \override SpanBar.transparent = ##t
      \override SpanBar.stencil = ##f
    } <<
      \new PianoStaff \with {
        \override SpanBar.transparent = ##t
        \override SpanBar.stencil = ##f
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
        \override StaffGrouper.staff-staff-spacing.minimum-distance = #3
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "L4a" \levelFourRight
        \new Staff = "L4b" { \clef bass \levelFourLeft }
      >>

      % Invisible staff for vertical space
      <<
        \new Staff \with {
          \remove Staff_symbol_engraver
          \override SpanBar.transparent = ##t
          \override Staff.BarLine.stencil = ##f
          \override SpanBar.stencil = ##f
          \override Staff.transparent = ##t % Make the entire staff invisible for spacing
          \override TimeSignature.stencil = ##f
          \override Clef.stencil = ##f
        } { s2.*8 }
      >>

      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
        \override StaffGrouper.staff-staff-spacing.minimum-distance = #3
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override TimeSignature.stencil = ##f

      } <<
        \new Staff = "empty3" \levelThreeRight
        \new Staff = "empty4" { \clef bass \levelThreeLeft }
      >>

      % Another invisible staff for vertical space
      <<
        \new Staff \with {
          \remove Staff_symbol_engraver
          \override SpanBar.transparent = ##t
          \override Staff.BarLine.stencil = ##f
          \override SpanBar.stencil = ##f
          \override Staff.transparent = ##t % Make the entire staff invisible for spacing
          \override TimeSignature.stencil = ##f
          \override Clef.stencil = ##f
        } { s2.*8 }
      >>

      \new PianoStaff \with {
       
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
        \override StaffGrouper.staff-staff-spacing.minimum-distance = #3
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override TimeSignature.stencil = ##f
 
      
      } <<
        \new Staff = "level2" {
            \override Staff.NoteColumn.merge-differently-headed = ##t
          \global
          \righthandTwo
        }
        \new Staff = "level2b" {
                    \override Staff.NoteColumn.merge-differently-headed = ##t
          \global
          \clef bass
          \lefthandTwo
        } 
      >> 
   >>

    % The piano at the bottom with actual music
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
      \override StaffGrouper.staff-staff-spacing.minimum-distance = #5
      \override StaffGrouper.staff-staff-spacing.padding = #1
    } <<
      \new Staff = "right" {
        \global
        \righthand
      }
      \new Staff = "left" {
        \global
        \clef bass
        \lefthand
      }
    >>
  >>

  \layout {
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
      \override NonMusicalPaperColumn.line-break-permission = ##f
      \override NonMusicalPaperColumn.page-break-permission = ##f
    }
  }
}
