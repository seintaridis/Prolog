 word(astante,a,s,t,a,n,t,e). 
 word(astoria,a,s,t,o,r,i,a). 
 word(baratto,b,a,r,a,t,t,o). 
 word(cobalto,c,o,b,a,l,t,o). 
 word(pistola,p,i,s,t,o,l,a). 
 word(statale,s,t,a,t,a,l,e).

crossword(V1,V2,V3,H1,H2,H3) :-
 
  word(H1,_,H12V12,_,H14V22,_,H16V32,_),
  word(H2,_,H22V14,_,H24V24,_,H26V34,_),
  word(H3,_,H32V16,_,H34V26,_,H36V36,_),

  word(V1,_,H12V12,_,H22V14,_,H32V16,_),
  word(V2,_,H14V22,_,H24V24,_,H34V26,_),
  word(V3,_,H16V32,_,H26V34,_,H36V36,_).
