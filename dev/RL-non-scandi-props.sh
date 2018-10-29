#!/bin/bash

lms () { grep '__np"'|sed 's/.*lm="\([^"]*\)".*/lm="\1"/' ; }

scandi-lms () { props apertium-nob.nob.dix | lms; }

other-lms () { sed -n '/\/SCANDIPROPS/,$p' apertium-nob.nob.dix |lms; }

need-RL () { comm -12 <(other-lms |sort -u)  <(scandi-lms |sort -u) ;}

rm-pure-dupes () {
    awk  '
{lm=""}
 /lm=".*".*__np"/{lm=$0; sub(/.*lm="/,"",lm);
sub(/".*/,"",lm);if(lm)lm="lm=\""lm"\""; par=$0;sub(/.*par n="/,"",par); sub(/".*/,"",par)}
lm in s&& par in s[lm]{next}{print}
lm{s[lm][par]++} '
}

add-RL () {
    awk -v rlf=<(need-RL) '
BEGIN{while(getline<rlf)rl[$0]++}
 /\/SCANDIPROPS/{s++}
 {hasrl=0; lm=""}
 /lm=".*".*__np"/{lm=$0; sub(/.*lm="/,"",lm);sub(/".*/,"",lm);if(lm)lm="lm=\""lm"\""}
 /r="RL"/{hasrl++}
 (!hasrl) && s&&lm&&lm in rl {sub(/<e /,"<e r=\"RL\" ", $0);}
{print}
'
}

< apertium-nob.nob.dix add-RL | rm-pure-dupes
