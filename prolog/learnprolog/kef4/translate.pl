tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).



translate([],[]).
translate([H1|T1],[H2|T2]):-
	tran(H1,H2),
	translate(T1,T2).			


member1(X,[X|T]). 
member1(X,[H|T])  :-  member1(X,T).





twice([],[]).
twice([H1|T1],[H1,H1|T2]):- twice(T1,T2). 
