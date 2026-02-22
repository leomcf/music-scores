\version "2.24.4"

% Define a function to add analysis lines below each measure
analysisLine = {
  \once \override Score.RehearsalMark.self-alignment-X = #CENTER
  \once \override Score.RehearsalMark.direction = #DOWN
  \once \override Score.RehearsalMark.padding = #3  % Space between staff and line
  \once \override Score.RehearsalMark.font-size = #-2
  \mark \markup { \draw-line #'(4 . 0) }  % Width of 4 is appropriate for most measures
}

% Sample music for demonstration - modify with your actual exam content
exampleMusic = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  
  % First line - 8 measures with analysis lines beneath each
  g4 a b c | \analysisLine
  d2 g,2 | \analysisLine
  c4 d e fis | \analysisLine
  g1 | \analysisLine
  a4 g fis e | \analysisLine
  d4 c b a | \analysisLine
  g4 a b c | \analysisLine
  d1 | \analysisLine \break
  
  % Second line - another 8 measures
  g,4 a b c | \analysisLine
  d2 g,2 | \analysisLine
  c4 d e fis | \analysisLine
  g1 | \analysisLine
  a4 g fis e | \analysisLine
  d4 c b a | \analysisLine
  g4 a b c | \analysisLine
  d1 | \analysisLine \break
}

% Create a simple melody exercise with lines for analysis
\score {
  \new Staff {
    \exampleMusic
  }
  \layout {
    \context {
      \Score
      \consists "Mark_engraver"
      \override RehearsalMark.break-visibility = #begin-of-line-invisible
    }
    
    % Force 8 measures per system
    \context {
      \Staff
      \consists "Measure_grouping_engraver"
    }
    
    \set Score.measureLength = #(ly:make-moment 4/4)  % 4/4 time
    \set Score.currentBarNumber = #1
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    
    % Strict 8 measures per system
    \override Score.BarLine.break-visibility = #'#(#f #t #t)
    \set Score.measureLength = #(ly:make-moment 4/4)
    \set Score.automaticBars = ##t
    \set Score.breakAfterMeasuresCount = 8
  }
}

% Additional example showing chord analysis
\markup { \vspace #2 }
\markup { \bold "Chord Analysis" }
\markup { \italic "Identify each chord with the appropriate Roman numeral" }

\score {
  \new Staff {
    \relative c' {
      \clef treble
      \key c \major
      \time 4/4
      
      % First system - 8 chords with lines beneath
      <c e g>1 | \analysisLine
      <f a c>1 | \analysisLine
      <g b d>1 | \analysisLine
      <c e g>1 | \analysisLine
      <a c e>1 | \analysisLine
      <d f a>1 | \analysisLine
      <g b d>1 | \analysisLine
      <c e g>1 | \analysisLine \break
    }
  }
  \layout {
    \context {
      \Score
      \consists "Mark_engraver"
      \override RehearsalMark.break-visibility = #begin-of-line-invisible
    }
    
    % Force 8 measures per system
    \set Score.breakAfterMeasuresCount = 8
  }
}