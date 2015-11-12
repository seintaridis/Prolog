my_append([],L,L).
my_append([X|L1],L2,[X|L3]):-
	my_append(L1,L2,L3).


rules(1,[antti,_,_,johan|_]).
rules(1,[johan,_,_,_,_,_,_,antti|_]).
rules(2,[johan,luis|_]).
rules(2,[luis,_,_,_,_,_,_,_,_,johan|_]).
rules(3,[jeroen,_,_,eric|_]).
rules(3,[eric,_,_,_,_,_,_,jeroen|_]).
rules(4,[jeroen,_,_,_,michel|_]).
rules(4,[michel,_,_,_,_,_,jeroen|_]).
rules(5,[eric,_,harris|_]).
rules(5,[harris,_,_,_,_,_,_,_,eric|_]).
rules(6,[antti,_,_,_,_,_,_,_,wolfang|_]).
rules(6,[wolfang,_,antti|_]).
rules(7,[peter,_,_,_,_,_,_,wolfang|_]).
rules(7,[wolfang,_,_,peter|_]).

iso(X,X).



seats(Seats):-seats([1,2,3,4,5,6,7],Seats).

seats([],Seats):-
		seats1(Seats).
seats([Rules|Tail],Seats):-
		iso(Seats,[yanis,_,_,_,_,_,_,_,_,_]),
		rules(Rules,Y),
		my_append(_,Y,Seats),
		seats(Tail,Seats).	
		

		
	
	
	
	seats1(S):-
	iso(S,[yanis,_,_,_,_,_,_,_,_,_]),
	my_append(_,[antti|_],S),
	my_append(_,[johan|_],S),
	my_append(_,[eric|_],S),
	my_append(_,[jeroen|_],S),
	my_append(_,[michel|_],S),
	my_append(_,[wolfang|_],S),
	my_append(_,[peter|_],S),
	my_append(_,[luis|_],S),
	my_append(_,[harris|_],S)
	.

	
%BONUS BONUS BONUS 1
%an to kalesoume me 6 kanones blepoume oti exei monadiki lisi	
rules1(1,[jeroen,_,_,eric|_]).
rules1(1,[eric,_,_,_,_,_,_,jeroen|_]).
rules1(2,[jeroen,_,_,_,michel|_]).
rules1(2,[michel,_,_,_,_,_,jeroen|_]).
rules1(3,[luis,_,_,harris|_]).
rules1(3,[harris,_,_,_,_,_,_,luis|_]).
rules1(4,[johan,_,_,_,harris|_]).
rules1(4,[harris,_,_,_,_,_,johan|_]).
rules1(5,[antti,_,_,_,_,_,_,_,wolfang|_]).
rules1(5,[wolfang,_,antti|_]).
rules1(6,[peter,_,_,_,_,_,_,wolfang|_]).
rules1(6,[wolfang,_,_,peter|_]).	

bonus_seats([],Seats):-
		seats1(Seats).
bonus_seats([Rules|Tail],Seats):-
		iso(Seats,[yanis,_,_,_,_,_,_,_,_,_]),
		rules1(Rules,Y),
		my_append(_,Y,Seats),
		bonus_seats(Tail,Seats).
		


seats2(S):-
	iso(S,[jeroen,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]),
	my_append(_,[hans|_],S),
	my_append(_,[johan|_],S),
	my_append(_,[harris|_],S),
	my_append(_,[maris|_],S),
	my_append(_,[antti|_],S),
	my_append(_,[michel|_],S),
	my_append(_,[wolfang|_],S),
	my_append(_,[yanis|_],S),
	my_append(_,[michael|_],S),
	my_append(_,[pier|_],S),
	my_append(_,[janis|_],S),
	my_append(_,[rimantas|_],S),
	my_append(_,[pierre|_],S),
	my_append(_,[edward|_],S),
	my_append(_,[eric|_],S),
	my_append(_,[maria|_],S),
	my_append(_,[peter|_],S),
	my_append(_,[dusan|_],S),
	my_append(_,[luis|_],S).


bonus_seats2([],Seats):-
		seats2(Seats).
bonus_seats2([Rules|Tail],Seats):-
		iso(Seats,[jeroen,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]),
		rules2(Rules,Y),
		my_append(_,Y,Seats),
		bonus_seats2(Tail,Seats).
