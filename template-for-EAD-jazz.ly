\version "2.24.4"

% Define a simple melody for analysis
melody = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  
  g4 a b c | 
  d2 g,2 | 
  c4 d e fis | 
  g1 \bar "||"
}

% Function to create horizontal answer lines
answerLines = \markup {
  \column {
    \line { \draw-line #'(15 . 0) }
    \vspace #0.5
    \line { \draw-line #'(15 . 0) }
  }
}

% Create labeled answer lines
labeledAnswerLine = \markup {
  \column {
    \line { Analysis: \hspace #0.5 \draw-line #'(12 . 0) }
  }
}

% Create short answer lines for chord symbols
chordAnswerLine = \markup {
  \column {
    \line { \draw-line #'(4 . 0) }
  }
}

% Main document structure

\markup { \bold "Part A: Melodic Analysis" }
\markup { \italic "Analyze the following melody, marking phrases and cadence points." }

\score {
  \new Staff {
    \melody
  }
  \layout { }
}

% Add answer lines after the score
\markup \answerLines

\markup { \vspace #1 }
\markup { \bold "Part B: Harmonic Analysis" }
\markup { \italic "Identify the chords in measures 1-2 with Roman numerals." }

\score {
  \new Staff {
    \relative c' {
      \clef treble
      \key g \major
      \time 4/4
      
      <g b d>1 |
      <d fis a>1 \bar "||"
    }
  }
  \layout { }
}

% Add lines for Roman numeral analysis beneath each chord
\markup {
  \halign #-4
  \center-column {
    \line {
      \hspace #2
      \chordAnswerLine
      \hspace #2.5
      \chordAnswerLine
    }
  }
}

\markup { \vspace #1.5 }
\markup { \bold "Part C: Detailed Analysis" }
\markup { \italic "Provide a complete analysis of the following chord progression." }

\score {
  \new Staff {
    \relative c' {
      \clef treble
      \key c \major
      \time 4/4
      
      <c e g>2 <a c e> |
      <f a c>2 <g b d> |
      <c e g>1 \bar "||"
    }
  }
  \layout { }
}

% Add labeled answer lines for detailed analysis
\markup \labeledAnswerLine
\markup { \vspace #0.5 }
\markup \labeledAnswerLine
\markup { \vspace #0.5 }
\markup \labeledAnswerLine

% Example question with music fragment to analyze
\markup { \vspace #2 }
\markup { \bold "Part D: Cadence Identification" }
\markup { \italic "Identify the type of cadence in each example." }

\score {
  \new Staff {
    \relative c' {
      \clef treble
      \key g \major
      \time 4/4
      
      d4 g fis g | a b c2 | b a4 g | fis e d2 \bar "||"
    }
  }
  \layout { }
}

\markup { Cadence type: \hspace #0.5 \draw-line #'(8 . 0) }

% Additional customization options (commented out examples)
%
% % Example of how to add numbered answer lines:
% \markup {
%   \column {
%     \line { 1. \hspace #0.5 \draw-line #'(14 . 0) }
%     \vspace #0.5
%     \line { 2. \hspace #0.5 \draw-line #'(14 . 0) }
%     \vspace #0.5
%     \line { 3. \hspace #0.5 \draw-line #'(14 . 0) }
%   }
% }