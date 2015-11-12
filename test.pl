mymember(X,[X|_]).
mymember(X,[_|T]):-
	mymember(X,T).



myappend([],L,L).

myappend([X|L1],L2,[X|L3]):-
	myappend(L1,L2,L3).

member1(X,L):- myappend([_|[X|_]],_,L).


del(X,[X|L],L).
del(X,[Y|L1],[Y|L2]):-
		del(X,L1,L2).



delete_last3(L,L1):-
	myappend(L1,[_,_,_],L).

delete_first_last3(L,L1):-
	delete_last3(L,L2),
	myappend([_,_,_],L1,L2).

last1(Item,List):-
	myappend(_,[Item],List).         %teleutaio stoixeio me append





last2(X,[X|[]]).                     %teleutaio stoixeio xwris to append
last2(Item,[_|T]):-last2(Item,T).


sublist(S,L):-
myappend(_,L1,L),
myappend(S,_,L1).


oddlist([_]).
oddlist([_,_|T]):-oddlist(T).		

evenlist([]).
evenlist([_,_|T]):-oddlist(T).

evenlengthed([]).
evenlengthed([_|Xs]) :-
   oddlengthed(Xs).





drop(L1,N,L3):-
  length(L1,K),
  K<N,
  myappend(L1,[],L3).

drop(List1,N,List2):-
myappend(L1,[_|L2],List1),
S is N-1,
length(L1,S),
drop(L2,N,L3),
myappend(L1,L3,List2).







