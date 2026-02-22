\version "2.24.4"

% Define a function to create answer lines below each measure
lineBelow = {
  \once \override Score.TextMark.self-alignment-X = #CENTER
  \once \override Score.TextMark.Y-offset = #-5
  \textMark \markup { \draw-line #'(15 . 0) }
}

% Alternative approach with afterGrace
answerLineAfter = {
  \afterGrace s1 {
    \once \override NoteHead.transparent = ##t
    \once \override Stem.transparent = ##t
    \once \override Flag.transparent = ##t
    \once \override Stem.direction = #DOWN
    \once \override NoteHead.Y-offset = #-4
    \once \override TextScript.Y-offset = #-5
    c8^\markup { \draw-line #'(15 . 0) }
  }
}

% Function to put an analysis line at the end of the staff
addLineAtEnd = \markup {
  \override #'(baseline-skip . 2)
  \column {
    \draw-line #'(16 . 0)
  }
}

% Example melody for analysis
melody = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  
  g4 a b c \lineBelow | 
  d2 g,2 \lineBelow | 
  c4 d e fis \lineBelow | 
  g1 \lineBelow \bar "||"
}

% Main document
\markup { \bold "Example 1: Lines directly under each measure" }
\markup { \italic "Analyze the harmony in each measure:" }

\score {
  \new Staff {
    \melody
  }
  \layout {
    \context {
      \Score
      \consists "Text_mark_engraver"
    }
  }
}

% Second approach - using system breaks to force measures to line up nicely
\markup { \vspace #2 }
\markup { \bold "Example 2: One measure per system with lines" }
\markup { \italic "Label each chord with the appropriate Roman numeral:" }

\score {
  \new Staff {
    \relative c'' {
      \clef treble
      \key c \major
      \time 4/4
      
      <c e g>1
      \break
      \addLineAtEnd
      
      <a c e>1
      \break
      \addLineAtEnd
      
      <f a c>1
      \break
      \addLineAtEnd
      
      <g b d>1
      \break
      \addLineAtEnd
      
      <c e g>1
      \bar "||"
    }
  }
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}
\markup \addLineAtEnd

% Third approach - using measure bars to position analysis lines
\markup { \vspace #2 }
\markup { \bold "Example 3: Chord progression with bar-aligned analysis lines" }
\markup { \italic "Write your analysis under each measure:" }

\score {
  \new Staff {
    \relative c' {
      \override Score.BarLine.stencil = ##f
      \override Score.SpanBar.stencil = ##f
      
      \repeat unfold 4 {
        \time 1/4
        c4 | \break \mark \markup { \draw-line #'(15 . 0) }
      }
    }
  }
  \layout {
    indent = 0
    \context {
      \Staff
      \remove "Time_signature_engraver"
    }
  }
}

% Fourth approach - for cadence identification with lines
\markup { \vspace #2 }
\markup { \bold "Example 4: Cadence analysis with lines under each measure" }

\score {
  \new Staff \with { 
    \override TimeSignature.stencil = ##f
  } {
    \relative c' {
      \clef treble
      \key d \major
      \time 2/4
      
      d4 fis \bar "||" \lineBelow \break
      g4 b \bar "||" \lineBelow \break
      a4 d \bar "||" \lineBelow \break
      e,4 a \bar "||" \lineBelow
    }
  }
  \layout {
    \context {
      \Score
      \consists "Text_mark_engraver"
    }
  }
}