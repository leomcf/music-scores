\version "2.24.1"

\paper {
  indent = 0
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  page-count = 1
}

% Create empty staves for analysis
emptyStaff = \relative c' {
  \stopStaff
  s2.*8
  \startStaff
}

% Global settings
global = {
  \key c \major
  \time 3/4
}

% Piano music at the bottom
righthand = { 
  \relative c''
  <g e' g>4 q q |
  q4. <g d' f>8 <g c e>4 |
  <g d' f>4 q q |
  q4. <g c e>8 <g b d>4 |
  <g c e>4 <a f'>8 <g e'> <f d'> <e c'> |
  <g c e>4. <f c' f>8 <g d' g>4 |
  \tuplet 2/3 {a8 g f}  <g c e>4  <f b d> |
  <e g c>4 r r   | 
}

lefthand = {
  c4 e g |
  c c, r4 |
  g b d |
  g g, r4 |
  c c' c |
  c4. a8 e4 |
  f8 d g4 g, |
  c g c |
}

% Score structure
\score {
  \new StaffGroup <<
    % Four empty piano systems for analysis
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #12
    } <<
      \new Staff = "empty1" \emptyStaff
      \new Staff = "empty2" \emptyStaff
    >>
    
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #12
    } <<
      \new Staff = "empty3" \emptyStaff
      \new Staff = "empty4" \emptyStaff
    >>
    
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #12
    } <<
      \new Staff = "empty5" \emptyStaff
      \new Staff = "empty6" \emptyStaff
    >>
    
    \new PianoStaff \with {
      \override StaffGrouper.staff-staff-spacing.basic-distance = #12
    } <<
      \new Staff = "empty7" \emptyStaff
      \new Staff = "empty8" \emptyStaff
    >>
    
    % The filled piano system at the bottom
    \new PianoStaff \with {
    %  instrumentName = "Piano"
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
      \Staff
      \remove "Time_signature_engraver"
    }
    \context {
      \PianoStaff
      \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #12
      \override StaffGrouper.staff-staff-spacing.padding = #5
    }
  }
}