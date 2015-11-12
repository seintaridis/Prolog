% i askisi etrexe kai dokimastike sto sisitima swi prolog
%ta prwta erwtimata trexoun amesws
%to teleutaio kanei sxedon 2 lepta
% ousisastika ilopoiisa tin move tin swap kai sti sinexeia
%i swapa ektelei eite tin move eite tin swap kai analoga kanei append stin teliki lista
% i codegen xrisimopoiei tin swapa omws kathe fora auksanei dinato mikos tis telikis append
% diladi kanw ousiastika anazitisi me epanaliptiki ekvathinsi

last1(Item,L):-
  append(_,[_|[Item]],L).

my_length([],0).
my_length([_|L],N):-
  my_length(L,M),
  N is M+1.

move([H1|L1],N,[H2|L2]):-
length([_|L1],T),
N<T,
K is N-1,
H1=H2,
move(L1,K,L2).


move([H,_|L1],1,[H,H|L1]).

move([_|L1],N,[H|L2]):-
length([_|L1],K),
K=N,
L2=L1,
last1(Item,L1),
H=Item.


element_at(X,[X|_],1).
element_at(X,[_|L],K) :- element_at(X,L,K1), K is K1 + 1.

add(N,1,[_|L1],[N|L1]).
add(N,K,[H|L1],[H|L2]):-
M is K-1,
add(N,M,L1,L2).


swap(L1,I,J,L2):-
I < J,
element_at(X,L1,I),
element_at(Y,L1,J),
add(X,J,L1,L3),
add(Y,I,L3,L2).

iso([],[]).
iso([H1|T1],[H2|T2]):-
H1=H2,
iso(T1,T2).

iso([_|T1],[H2|T2]):-
H2='*',
iso(T1,T2).


swapa(L1,L2,_,T,_,_):-
iso(L1,L2),
append([],[],T).


swapa(L1,L2,S,L5,Lim,Size):-
    T is S+1,
    T<Lim+1,
    Size1 is Size-1,
    between(1,Size1,X),
    between(1,Size,Y),
    X<Y,
    swap(L1,X,Y,L3),
    append([swap(X,Y)],K,L5),
    swapa(L3,L2,T,K,Lim,Size).


swapa(L1,L2,S,L5,Lim,Size):-
    T is S+1,
    T<Lim+1,
    between(1,Size,X),
    move(L1,X,L3),
    append([move(X)],K,L5),
    swapa(L3,L2,T,K,Lim,Size).


codegen(L1,L2,T):-
    my_length(L1,N),
    between(1,N,K),
    swapa(L1,L2,0,T,K,N),!.
