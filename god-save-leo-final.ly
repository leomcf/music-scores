\version "2.24.1"
\paper {
  indent = 0
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  page-count = 1
  tagline = ##f
}

% Empty staff with NO barlines
emptyStaffNoBarlines = {
  \stopStaff
  \once \override Staff.StaffSymbol.transparent = ##f
  \startStaff
  \override Staff.Clef.transparent = ##f
  \override Staff.BarLine.transparent = ##t
  \override Staff.BarLine.stencil = ##f
  \override Staff.TimeSignature.transparent = ##t
  s2.*8
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
  c g c, \bar "|."|
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
        \override StaffGrouper.staff-staff-spacing.basic-distance = #12
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "empty1" \emptyStaffNoBarlines
        \new Staff = "empty2" { \clef bass \emptyStaffNoBarlines }
      >>
      
      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #12
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "empty3" \emptyStaffNoBarlines
        \new Staff = "empty4" { \clef bass \emptyStaffNoBarlines }
      >>
      
      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #12
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "empty5" \emptyStaffNoBarlines
        \new Staff = "empty6" { \clef bass \emptyStaffNoBarlines }
      >>
      
      \new PianoStaff \with {
        \override StaffGrouper.staff-staff-spacing.basic-distance = #12
        \override TimeSignature.stencil = ##f
      } <<
        \new Staff = "empty7" \emptyStaffNoBarlines
        \new Staff = "empty8" { \clef bass \emptyStaffNoBarlines }
      >>
    >>
    
    % The piano at the bottom
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #12
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
    \context {
      \PianoStaff
      \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #12
      \override StaffGrouper.staff-staff-spacing.padding = #5
    }
  }
}