:- lib(fd).

men([rick,jack,john,hugh,greg,nick,bill,andy,alan,dick]).
women([helen,tracy,linda,sally,wanda,maria,diana,patty,jenny,lilly]).
prefers(rick,[tracy,linda,jenny,maria,wanda,sally,diana,patty,helen,lilly]).
prefers(jack,[tracy,lilly,patty,sally,diana,linda,jenny,helen,maria,wanda]).
prefers(john,[diana,jenny,wanda,linda,patty,tracy,sally,helen,lilly,maria]).
prefers(hugh,[helen,wanda,diana,maria,sally,patty,linda,lilly,jenny,tracy]).
prefers(greg,[jenny,maria,lilly,patty,sally,linda,tracy,diana,helen,wanda]).
prefers(nick,[sally,linda,diana,maria,jenny,lilly,wanda,helen,patty,tracy]).
prefers(bill,[linda,tracy,diana,patty,lilly,sally,jenny,helen,wanda,maria]).
prefers(andy,[helen,jenny,lilly,maria,sally,patty,wanda,tracy,diana,linda]).
prefers(alan,[patty,sally,maria,jenny,linda,diana,helen,lilly,tracy,wanda]).
prefers(dick,[sally,wanda,helen,maria,lilly,diana,jenny,tracy,patty,linda]).
prefers(helen,[alan,rick,nick,bill,jack,hugh,dick,john,andy,greg]).
prefers(tracy,[andy,john,alan,hugh,bill,rick,greg,dick,jack,nick]).
prefers(linda,[dick,hugh,john,nick,andy,greg,alan,jack,bill,rick]).
prefers(sally,[nick,dick,bill,rick,greg,andy,jack,hugh,alan,john]).
prefers(wanda,[greg,bill,dick,jack,john,nick,alan,andy,rick,hugh]).
prefers(maria,[john,alan,nick,rick,greg,hugh,jack,bill,andy,dick]).
prefers(diana,[greg,hugh,andy,nick,john,bill,alan,dick,jack,rick]).
prefers(patty,[alan,bill,jack,hugh,greg,dick,rick,nick,andy,john]).
prefers(jenny,[greg,dick,jack,bill,alan,john,andy,hugh,rick,nick]).
prefers(lilly,[hugh,jack,dick,nick,andy,alan,greg,rick,bill,john]).

how_prefer(Name1,Name2,N):-
	prefers(Name1,Table),
	element(N,Table,Name2).






constrain([],[],_,_).

constrain([ManH|ManT],[HerH|HerT],Woman,Him):-
	every_woman(ManH,HerH,Woman,Him),
	constrain(ManT,HerT,Woman,Him).


every_woman(_,_,[],[]).
every_woman(ManH,HerH,[WomanH|WomanT],[HimH|HimT]):-
 	 how_prefer(ManH,HerH,N1),                    %poso protimaei o andras A tin sizigo t G
	 how_prefer(ManH,WomanH,N2),                  %poso protimaei mia alli ginaika G1
 	 how_prefer(WomanH,HimH,N3),                  %poso protimaei auti i ginaika G1 ton andra tis A1
	 how_prefer(WomanH,ManH,N4),                  %poso protimaei auti i ginaika G1 ton andra A
	 N1#>N2 #=> N3#<N4,
	 N3#>N4 #=> N1#<N2,

         
	 ManH #=HimH #<=> WomanH#=HerH,
	 every_woman(ManH,HerH,WomanT,HimT).




stable(M):-
	women(WOMEN),
	men(MEN),
	length(Male,N),
	length(Female,N),
	Male :: WOMEN,                              %arxikopoiw tis mellontimkes ginaikes
	Female :: MEN,			            %arxikopoiw tous mellontikous andres
	alldifferent(Male),                         %gia na exoume diaforetika onomata se kathe lista
	alldifferent(Female),
	constrain(MEN,Male,WOMEN,Female),!,
	generate(Female),
	print_marriage(MEN,Male,M)

.



generate([]).
generate(L) :-
   deleteff(X, L, R),
   indomain(X),
   generate(R).

print_marriage([],[],[]).
print_marriage([ManH|ManT],[WomanH|WomanT],[ManH-WomanH|Tail]):-print_marriage(ManT,WomanT,Tail).


