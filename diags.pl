my_append([],L,L).
my_append([X|L],L2,[X|L3]):-
  my_append(L,L2,L3).

last1(Item,L):-
  my_append(_,[_|[Item]],L).

my_reverse([],[]).
my_reverse([First|Rest],Reversed):-
  my_reverse(Rest,ReversedRest),
  my_append(ReversedRest,[First],Reversed).

my_length([],0).
my_length([_|L],N):-
  my_length(L,M),
  N is M+1.

element_at(X,[X|_],1).
element_at(X,[_|L],K) :- element_at(X,L,K1), K is K1 + 1.

info_diags(L,Rows,Columns):-
last1(X,L),
not(my_length(X,Rows)),         %vazw to not gt se peripwsi p exoume mia stili m dine dipli lisi
flatten(L,J),
my_length(L,X1),                  %se periptwsh exoume mia grammi mono
my_length(J,X2),
X1 is X2,
Rows is 1,
Columns is X1.

info_diags(L,Rows,Columns):-
  my_length(L,Rows),              % arithmos grammwn
  last1(X,L),                     %pairnw ena stoixio tis ouras
  my_length(X,Columns)     %arithmos stilwn
.

diags(J,DiagsDown,DiagsUp):-
  info_diags(J,Rows,Columns),
  my_reverse(J,J2),      %gia na parw kai tis diagwnios apo katw
  flatten(J,L),
  flatten(J2,L15),
  pull_diags(L,1,1,Rows,Columns,L,List),
  pull_diags_row(L,2,Columns,Rows,Columns,L,List1),
  my_append(List,List1,DiagsUp),
  %my_reverse(L,L2),
  pull_diags1(L15,1,1,Rows,Columns,L15,Lista),
  pull_diags_row1(L15,2,Columns,Rows,Columns,L15,Lista1),
  my_append(Lista,Lista1,DiagsDown)        .

x_y_to_number(X,Y,Columns,N):-      %analoga me tis sintetagmenes pairnw arithmo apo tin lista
 N is (X-1)*Columns+Y.


diagonies(_,_,0,_,_,T,_):-           %analoga me tis sintetagmenes travaei ta stoixeia mia diagoniou
my_append([],[],T).

diagonies(_,X,K,Rows,_,T,_):-
X is Rows+1,
K>0,
my_append([],[],T).

diagonies(_,X,K,_,Columns,T,_):-
K is Columns+1,
X>0,
my_append([],[],T).


diagonies([_|L],I,J,Rows,Columns,T,L1):-
 I<Rows+1,
 J<Columns+1,
 x_y_to_number(I,J,Columns,N),
 element_at(H,L1,N),
 my_append([H],K,T),
 Grammi is I+1,
 Stili is J-1,
 diagonies(L,Grammi,Stili,Rows,Columns,K,L1).

pull_diags(_,_,0,_,_,_,List):-                  %travaei oles tis diagwnious apo tin prwti grammi
  my_append([],[],List).

pull_diags(_,_,J,_,Columns,_,List):-
  J is Columns+1,
  my_append([],[],List).

 pull_diags(L,I,J,Rows,Columns,L1,List):-
  J<Columns+1,
  diagonies(L,I,J,Rows,Columns,T,L1),
  K is J+1,
  my_append([T],Z,List),
  pull_diags(L,I,K,Rows,Columns,L1,Z).

pull_diags_row(_,_,0,_,_,_,List):-           %travaei oles tis diagwnious apo tin teleutaia stili kai deuteri grammi
  my_append([],[],List).

pull_diags_row(_,I,_,Rows,_,_,List):-
  I is Rows+1,
  my_append([],[],List).

 pull_diags_row(L,I,J,Rows,Columns,L1,List):-
  I<Rows+1,
  diagonies(L,I,J,Rows,Columns,T,L1),
  K is I+1,
  my_append([T],Z,List),
  pull_diags_row(L,K,J,Rows,Columns,L1,Z).

  pull_diags1(_,_,0,_,_,_,List):-
    my_append([],[],List).

  pull_diags1(_,_,J,_,Columns,_,List):-
    J is Columns+1,
    my_append([],[],List).

pull_diags1(L,I,J,Rows,Columns,L1,List):-
    J<Columns+1,
    diagonies(L,I,J,Rows,Columns,T,L1),
    K is J+1,
    my_reverse(T,Ksa),
    my_append([Ksa],Z,List),
    pull_diags1(L,I,K,Rows,Columns,L1,Z).

pull_diags_row1(_,_,0,_,_,_,List):-
    my_append([],[],List).

  pull_diags_row1(_,I,_,Rows,_,_,List):-
    I is Rows+1,
    my_append([],[],List).

   pull_diags_row1(L,I,J,Rows,Columns,L1,List):-
    I<Rows+1,
    diagonies(L,I,J,Rows,Columns,T,L1),
    my_reverse(T,Ksa),

    K is I+1,
    my_append([Ksa],Z,List),
    pull_diags_row1(L,K,J,Rows,Columns,L1,Z).



    %o kwdikas vgike megalos gt protimisa na mn valw ! alliws tha tan ipodiplasios
    % i logiki einai oti arxika travaw to mikos kai to platos t pinaka kai stin sinexxeia
    %travaw oles tis diagwnious apo tin prwti grammi kai meta apo tin teleutaia stili
    % kanw ena reverse tis arxikis stilis gia na traviksw meta oles tis diagwnious apo katw
    %alla afou ekana reverse travaw apo panw kai m dinei to epithimito apotelesma 
