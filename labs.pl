:- lib(fd).

labs(N, Solution,Sum) :-
   length(Solution, N),

   Solution :: [-1,1],
   constrain(N,Solution,Sum),
   min_max(generate(Solution),Sum).







element_at(X,[X|_],0).
element_at(X,[_|L],K) :- element_at(X,L,K1), K is K1 + 1.


iso(X,X).


sum_c(N,K,I,_,Suma,Sum):-
Check #= N-K-1,
I>Check,
Check >0-1,
iso(Sum,Suma).

sum_c(N,K,I,L,Suma,Sum):-
  Check #= N-K-1,
  I<Check+1,
  J #= I + K,
  Ts #= I+1,
  element_at(Y,L,J),
  element_at(X,L,I),
  Result #= X*Y,
  Tso #= Suma,
  Re #= Result+Tso,

  sum_c(N,K,Ts,L,Re,Sum).



constrain(N,Solution,Sum):-
 sum_e(N,1,Solution,0,Sum)

 .

sum_e(N,K,_,Suma,Sum):-
Check #=  N-1,
K>Check,
Check>0,
iso(Sum,Suma).

sum_e(N,K,L,Suma,Sum):-
Check #= N-1,
K<Check+1,
Ts #= K+1,
sum_c(N,K,0,L,0,A),
Tso #= Suma,
X #= A*A,
Re #= X+Tso,
sum_e(N,Ts,L,Re,Sum).



generate([]).
generate(L) :-
   deleteff(X, L, R),
   indomain(X),
   generate(R).
