seats(X):-
	subset([johan,_,_,_,_,_,_,antti],X);
	subset([antti,_,_,johan],X),
	subset([luis,_,_,_,_,_,_,_,_,johan],X);
	subset([johan,luis],X),
	subset(X,[_,_,_,_,_,_,_,_,_,_]).
	

