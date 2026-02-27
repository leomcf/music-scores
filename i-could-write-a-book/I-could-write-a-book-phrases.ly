\version "2.24.1"

%%% Full score: dotted harmonic slurs + contrepoint à 3 voix + advanced analysis
%%% For the stripped-down stage-one view, compile I-could-write-a-book-stage1.ly

showAnalysisAdvanced = ##t
showAnalysisOne = ##t
showAnalysisTwo = ##t
showDegreeBoxes = ##f

\include "I-could-write-a-book-defs.ily"


\header {
  title = "I Could Write A Book"
  subtitle = "Chiffrage avec modulations"
  composer = "Richard Rodgers"
  arranger = "Lorenz  Hart"
  copyright = "correction de Leo McFadden"
}


\paper {
  indent = 20
  system-system-spacing.basic-distance = 15
  score-system-spacing.basic-distance = 25
  markup-system-spacing.basic-distance = 18
}


\score {
  <<
    \new Staff = "treble" {
      <<
        \melody
        \new Voice {
          \partial 2 s2
          s1 * 4 \break
          s1 * 4 \break
          s1 * 4 \break
          \repeat unfold 4 { s1 * 4 \break }
          s1 * 4   % bar 29–32, no break
        }
      >>
    }

    \new ChordNames {
      \mainChords
    }

    \new RhythmicStaff {
      <<
        \new Voice = "phrasing" \with {
        %  \omit NoteHead
        %  \omit Stem
        %  \omit Beam
        %  \omit Flag
        } \phrasingHarmonic

        \new Voice = "harmonicR" \with {
          \omit NoteHead
          \omit Stem
          \omit Beam
          \omit Flag
        } \harmonicR
      >>
    }

    \new Lyrics \lyricsto "harmonicR" { \analysis }
    \advancedAnalysis {
      \new Lyrics \lyricsto "harmonicR" { \analysisSol }
    } 
    
    { }

 
  >>

  \layout {
    \Score
    \override StaffGrouper.staff-staff-spacing.padding = #10
    \override StaffGrouper.staff-staff-spacing.basic-distance = #10
  }

  \midi {}
}
