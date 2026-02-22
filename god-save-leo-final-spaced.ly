\version "2.24.1"
\paper {
  indent = 0
  ragged-last-bottom = ##f
  %ragged-bottom = ##f
  page-count = 1
  tagline = ##f
  top-margin = 3\cm
  bottom-margin = 0\cm  % Added to push content closer to bottom
  % Increased space between systems
  system-system-spacing.minimum-distance = #30  % Increased from 15
  system-system-spacing.padding = #30  % Added padding
  system-system-spacing.stretchability = #30  % Added stretchability
}

% Empty staff with NO barlines, but staff lines are visible.
% Clefs and time signatures are invisible.
emptyStaffNoBarlines = {
  \override Staff.StaffSymbol.transparent = ##f % Ensure staff lines are visible
  \override Staff.Clef.transparent = ##t        % Make clef invisible
  \override Staff.BarLine.transparent = ##t     % Make barlines invisible
  \override Staff.BarLine.stencil = ##f         % Ensure no stencil for barlines
  \override Staff.TimeSignature.transparent = ##t % Make time signature invisible
  s2.*8 % Eight measures of silence to occupy space
}

% Global settings
global = {
  \key c \major
  \time 3/4
}

% Piano music at the bottom
righthand = \relative c'' {
  <g e' g>4 q q |
  q4. <g d' f>8 <g c e>4 |
  <g d' f>4 q q |
  q4. <g c e>8 <g b d>4 |
  <g c e>4 <a f'>8 <g e'> <f d'> <e c'> |
  <g c e>4. <f c' f>8 <g c g'>4 |
  \tuplet 3/2 {a'8 g f} <g, c e>4 <f b d> |
  <e g c>4 r r \bar "|."
}

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
      % Removed VerticalAxisGroup override here to allow global system-system-spacing to apply
    } <<
      \new PianoStaff \with {
        \override SpanBar.transparent = ##t
        \override SpanBar.stencil = ##f
        % Reduced spacing between staves within each piano staff
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
        \override StaffGrouper.staff-staff-spacing.minimum-distance = #3
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override TimeSignature.stencil = ##f % Time signature on PianoStaff is often handled globally for it
      } <<
        \new Staff = "empty1" \emptyStaffNoBarlines
        \new Staff = "empty2" { \clef bass \emptyStaffNoBarlines }
      >>

      % This staff is intended to be completely invisible and provide vertical space.
      <<
        \new Staff \with {          
                        
          \remove Staff_symbol_engraver
        \override SpanBar.transparent = ##t
          \override Staff.BarLine.stencil = ##f
  
      \override SpanBar.stencil = ##f
       \override Staff.transparent = ##f
           \override TimeSignature.stencil = ##f
           \override Clef.stencil = ##f
      
                
     %     \override Staff.transparent = ##f % Make the entire staff (including lines, clef, notes, barlines) invisible
        } { s2.*8 } % Add silence to occupy space
      >>

      \new PianoStaff \with {
        % Reduced spacing between staves within each piano staff
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
        \override StaffGrouper.staff-staff-spacing.minimum-distance = #3
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "empty3" \emptyStaffNoBarlines
        \new Staff = "empty4" { \clef bass \emptyStaffNoBarlines }
      >>
      
            <<
        \new Staff \with {          
                        
          \remove Staff_symbol_engraver
        \override SpanBar.transparent = ##t
          \override Staff.BarLine.stencil = ##f
  
      \override SpanBar.stencil = ##f
       \override Staff.transparent = ##f
           \override TimeSignature.stencil = ##f
           \override Clef.stencil = ##f
      
                
     %     \override Staff.transparent = ##f % Make the entire staff (including lines, clef, notes, barlines) invisible
        } { s2.*8 } % Add silence to occupy space
      >>

      \new PianoStaff \with {
        % Reduced spacing between staves within each piano staff
        \override StaffGrouper.staff-staff-spacing.basic-distance = #4
        \override StaffGrouper.staff-staff-spacing.minimum-distance = #3
        \override StaffGrouper.staff-staff-spacing.padding = #1
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "empty5" \emptyStaffNoBarlines
        \new Staff = "empty6" { \clef bass \emptyStaffNoBarlines }
      >>
    >>

    % The piano at the bottom with actual music
    \new PianoStaff \with {
      % Tight spacing for the actual piano part
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
